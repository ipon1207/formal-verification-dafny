// ステージ2-1：配列の合計（ループ不変条件の入門）
// 実装はもう書いてある。でもこのままだと検証が通らない
// ゴール：invariant（ループ不変条件）を書き足して検証を通す
//
// ヒント
// - 不変条件は「ループの各周回の頭で、必ず成り立っていること」
// - i の範囲と、「s がここまでの合計になっている」ことの2つを言えればよい
// - SumTo(a[..], i) は「先頭から i 個の合計」を表す

function SumTo(a: seq<int>, n: nat): int
  requires n <= |a|
{
  if n == 0 then 0 else SumTo(a, n - 1) + a[n - 1]
}

method Sum(a: array<int>) returns (s: int)
  ensures s == SumTo(a[..], a.Length)
{
  s := 0;
  var i := 0;
  while i < a.Length
    // TODO: invariant を書く
  {
    s := s + a[i];
    i := i + 1;
  }
}
