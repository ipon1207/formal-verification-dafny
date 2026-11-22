// ステージ2-2：線形探索
// 見つかればその位置、なければ -1 を返す
// ゴール：invariant を書き足して検証を通す
//
// ヒント
// - 「なければ -1」の ensures を証明するには、ループが終わった時点で
//   「全部見たけど key は無かった」と言える必要がある
// - それを「ここまで見た範囲には key は無かった」という不変条件で運ぶ

method Find(a: array<int>, key: int) returns (i: int)
  ensures 0 <= i ==> i < a.Length && a[i] == key
  ensures i < 0 ==> forall k :: 0 <= k < a.Length ==> a[k] != key
{
  i := 0;
  while i < a.Length
    // TODO: invariant を書く
  {
    if a[i] == key {
      return;
    }
    i := i + 1;
  }
  i := -1;
}
