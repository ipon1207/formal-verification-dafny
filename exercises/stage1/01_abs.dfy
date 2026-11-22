// ステージ1-1：絶対値
// ゴール：ensures（事後条件）を満たすように本体を書き、`dafny verify` を通す
//
// 通ったら試すこと
// - ensures を1行ずつ消して、どんな「間違った実装」が通ってしまうか確かめる
//   （例：y := 0; は1行目の ensures だけなら通る）

method Abs(x: int) returns (y: int)
  ensures y >= 0
  ensures y == x || y == -x
{
  if x < 0 {
    y := -x;
  } else {
    y := x;
  }
}
