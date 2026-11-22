// ステージ3-3：配列をその場で反転する（modifies と old の体験）
// ゴール：invariant を書き足して検証を通す
//
// 新しく出てくるもの
// - modifies a：このメソッドは配列 a を書き換えてよい、という宣言
// - old(a[k])：メソッド呼び出し時点での a[k] の値
//
// ヒント（不変条件は3本あると通しやすい）
// - i の範囲
// - 左端から i 個と右端から i 個は、もう入れ替え済み
// - 真ん中のまだ触っていない部分は、元のまま

method Reverse(a: array<int>)
  modifies a
  ensures forall k :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
{
  var i := 0;
  while i < a.Length / 2
    // TODO: invariant を書く
  {
    a[i], a[a.Length - 1 - i] := a[a.Length - 1 - i], a[i];
    i := i + 1;
  }
}
