// ステージ3-2：オーバーフローを検証器に見つけてもらう
// Dafny の int は上限のない整数なので、C# の int（32ビット）を newtype で再現する
//
// ゴール
// 1. まずこのまま検証して、エラーメッセージを読む
// 2. なぜ (lo + hi) / 2 が危ないのか説明できるようにする
// 3. 検証が通る式に直す
//
// 参考：これは Java の標準ライブラリの二分探索に何年も残っていた有名なバグと同じ形

newtype int32 = x: int | -0x8000_0000 <= x < 0x8000_0000

method Midpoint(lo: int32, hi: int32) returns (mid: int32)
  requires 0 <= lo <= hi
  ensures lo <= mid <= hi
{
  mid := (lo + hi) / 2;  // TODO: 検証エラーの理由を考えて直す
}
