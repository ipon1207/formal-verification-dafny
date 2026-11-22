// ステージ4-1：お釣りの計算（POSっぽい題材）
// 大きい金種から順に、できるだけ多く使う（貪欲法）
// 例：denoms = [10000, 5000, 1000, 500, 100, 50, 10, 5, 1]、change = 632
//     → counts = [0, 0, 0, 1, 1, 0, 3, 0, 2]
//
// 保証したいこと
// - どの金種の枚数も負にならない
// - 枚数×金額の合計が、ちょうどお釣りの額になる
//
// ゴール：invariant を書き足して検証を通す
//
// ヒント
// - Total は「後ろから」再帰する形にしてある。counts に要素を後ろへ足していくループと相性がいい
// - 「ここまでで払い出した額 + 残り rest = お釣り全体」が中心になる不変条件
// - ループの最後に rest == 0 を言うには、「rest は直前の金種より小さい」を運ぶとよい
//   （最後の金種が 1 なので、rest < 1 から rest == 0 が出る）
// - 列の一部を取り出す式（counts[..i] など）で詰まったら、assert で「この2つの列は等しい」と
//   Dafny に教えると通ることがある

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
    // TODO: invariant を書く
  {
    var d := denoms[i];
    var c := rest / d;
    counts := counts + [c];
    rest := rest % d;
    i := i + 1;
  }
}
