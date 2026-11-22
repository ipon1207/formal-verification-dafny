# Register the roadmap (label, milestones, issues) in the current GitHub repository.
# Requirements: GitHub CLI (gh), logged in with `gh auth login`.
# Usage (run from the repository root):
#   powershell -ExecutionPolicy Bypass -File roadmap/create-issues.ps1
#   powershell -ExecutionPolicy Bypass -File roadmap/create-issues.ps1 -DryRun

param(
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$jsonPath = Join-Path $PSScriptRoot "issues.json"
$data = Get-Content -Raw -Encoding UTF8 $jsonPath | ConvertFrom-Json

$repo = gh repo view --json nameWithOwner --jq .nameWithOwner
if (-not $repo) { throw "Not inside a GitHub repository (gh repo view failed)." }
Write-Host "Target repository: $repo"

# Label
$label = $data.label
$existingLabels = gh label list --limit 200 --json name --jq ".[].name"
if ($existingLabels -notcontains $label.name) {
    Write-Host "Create label: $($label.name)"
    if (-not $DryRun) {
        gh label create $label.name --color $label.color --description $label.description | Out-Null
    }
}

# Milestones
$existingMilestones = gh api "repos/$repo/milestones?state=all&per_page=100" --jq ".[].title"
foreach ($m in $data.milestones) {
    if ($existingMilestones -notcontains $m.title) {
        Write-Host "Create milestone: $($m.title)"
        if (-not $DryRun) {
            gh api "repos/$repo/milestones" -f title="$($m.title)" -f description="$($m.description)" | Out-Null
        }
    } else {
        Write-Host "Skip milestone (exists): $($m.title)"
    }
}

# Issues (skip if an issue with the same title already exists)
$existingIssues = gh issue list --state all --limit 500 --json title --jq ".[].title"
foreach ($i in $data.issues) {
    if ($existingIssues -contains $i.title) {
        Write-Host "Skip issue (exists): $($i.title)"
        continue
    }
    Write-Host "Create issue: $($i.title)"
    if (-not $DryRun) {
        $tmp = New-TemporaryFile
        [System.IO.File]::WriteAllText($tmp.FullName, $i.body, (New-Object System.Text.UTF8Encoding $false))
        gh issue create --title $i.title --body-file $tmp.FullName --milestone $i.milestone --label $label.name | Out-Null
        Remove-Item $tmp.FullName
    }
}

Write-Host "Done."
