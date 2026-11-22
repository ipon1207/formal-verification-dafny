# Dafnyで入門する形式検証

プログラムを書きながら形式検証に入門するための練習問題とロードマップ
仕様（requires / ensures）と不変条件（invariant）を書き、検証器に正しさを証明させる体験を積み上げる

## 構成

```
exercises/   練習問題（このままだと検証が通らない。通るように直す）
solutions/   解答例（詰まったときだけ見る）
roadmap/     GitHub の Milestone・Issue に登録するためのデータとスクリプト
```

## ステージ

| ステージ | テーマ | 問題 |
|---|---|---|
| 0 | 環境構築 | Dafny を動かし、検証が落ちる・通るを見る |
| 1 | 契約を書く | Abs、Max、Clamp（requires）、Min（仕様を自分で書く） |
| 2 | ループ不変条件 | Sum、Find、MaxElement |
| 3 | 本物のバグと戦う | 二分探索、オーバーフロー、配列の反転（modifies / old） |
| 4 | 自分の題材で検証する | お釣りの計算、自分で選んだ POS っぽいルール |
| 5 | 次の方向を決める | TLA+ か Lean 4 か |

## 進め方

1. `exercises/` のファイルを開く
2. ファイル冒頭のコメント（ゴールとヒント）を読む
3. `TODO` を埋めて、エディタの赤線が消えるまで直す
4. 通ったら、コメントにある「試すこと」をやってみる（わざと壊して、検証器が何と言うか読む）
5. 振り返りを Issue に書いて閉じる

詰まったら、解答を見る前に次の順で考える

- エラーメッセージは「どの ensures / invariant が」「どこで」成り立たないと言っているか
- ループの1周目の頭、任意の周の頭、ループを抜けた直後、のどこで崩れているか
- 自分が「当たり前」と思っていることを assert で書いてみて、Dafny も同意するか

## 環境構築

1. VS Code に Dafny 拡張（`dafny-lang.ide-vscode`）を入れる
2. 拡張の案内に従って Dafny 本体を入れる
3. コマンドラインで使うときは次のように実行する

```
dafny verify exercises/stage1/01_abs.dfy
```

## ロードマップを GitHub に登録する

このフォルダを GitHub リポジトリにしてから、リポジトリのルートで実行する
（GitHub CLI `gh` にログインしている必要がある）

```powershell
# まず何が作られるかだけ確認する
powershell -ExecutionPolicy Bypass -File roadmap/create-issues.ps1 -DryRun

# 実際に登録する
powershell -ExecutionPolicy Bypass -File roadmap/create-issues.ps1
```

ラベル `formal-verification`、Milestone 6 個（Stage 0〜5）、Issue 14 個ができる
同じ名前のものがすでにあれば作らずに飛ばすので、何度実行しても重複しない

## 参考資料

- K. Rustan M. Leino『Program Proofs』（MIT Press）— Dafny の作者による教科書
- Dafny 公式サイトのチュートリアル・リファレンス
- 次のステップ：Learn TLA+（Hillel Wayne）、Natural Number Game（Lean 4）
