// ステージ3-1：二分探索
// 実装はある。invariant を書き足して検証を通す
//
// ヒント
// - lo と hi の範囲
// - 「lo より左は全部 key より小さい」
// - 「hi から右は全部 key より大きい」
// - 終了性（ループが必ず終わること）は Dafny が hi - lo から推測してくれる
//
// 通ったら試すこと
// - mid の計算を lo + (hi - lo) / 2 から別の式に変えて、何が起きるか
// - requires Sorted(a) を消すと、どこで失敗するか

predicate Sorted(a: array<int>)
  reads a
{
  forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
}

method BinarySearch(a: array<int>, key: int) returns (index: int)
  requires Sorted(a)
  ensures 0 <= index ==> index < a.Length && a[index] == key
  ensures index < 0 ==> forall k :: 0 <= k < a.Length ==> a[k] != key
{
  var lo, hi := 0, a.Length;
  while lo < hi
    // TODO: invariant を書く
  {
    var mid := lo + (hi - lo) / 2;
    if a[mid] < key {
      lo := mid + 1;
    } else if a[mid] > key {
      hi := mid;
    } else {
      return mid;
    }
  }
  index := -1;
}
