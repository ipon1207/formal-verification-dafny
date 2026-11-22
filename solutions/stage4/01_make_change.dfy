function Total(counts: seq<int>, denoms: seq<int>): int
  requires |counts| == |denoms|
{
  if |counts| == 0 then 0
  else Total(counts[..|counts| - 1], denoms[..|denoms| - 1])
       + counts[|counts| - 1] * denoms[|denoms| - 1]
}

method MakeChange(change: int, denoms: seq<int>) returns (counts: seq<int>)
  requires change >= 0
  requires |denoms| > 0
  requires forall k :: 0 <= k < |denoms| ==> denoms[k] > 0
  requires denoms[|denoms| - 1] == 1
  ensures |counts| == |denoms|
  ensures forall k :: 0 <= k < |counts| ==> counts[k] >= 0
  ensures Total(counts, denoms) == change
{
  var rest := change;
  counts := [];
  var i := 0;
  while i < |denoms|
    invariant 0 <= i <= |denoms|
    invariant |counts| == i
    invariant forall k :: 0 <= k < i ==> counts[k] >= 0
    invariant rest >= 0
    // ここまで払い出した額 + 残り = お釣り全体
    invariant Total(counts, denoms[..i]) + rest == change
    // 残りは直前の金種より小さい（最後の金種が 1 なので、終了時に rest == 0 が出る）
    invariant i > 0 ==> rest < denoms[i - 1]
  {
    var d := denoms[i];
    var c := rest / d;
    assert c >= 0;
    // Total を1段展開できるように、列の等式を教える
    assert (counts + [c])[..i] == counts;
    assert denoms[..i + 1][..i] == denoms[..i];
    counts := counts + [c];
    rest := rest % d;
    i := i + 1;
  }
  assert denoms[..|denoms|] == denoms;
}
