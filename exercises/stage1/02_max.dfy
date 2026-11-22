// ステージ1-2：2つの値の最大値
// ゴール：本体を書いて検証を通す
//
// 考えること
// - 1つ目の ensures だけだと、どんな間違った実装が通るか
// - 2つ目の ensures は何を防いでいるのか

method Max(a: int, b: int) returns (m: int)
  ensures m >= a && m >= b
  ensures m == a || m == b
{
  if a >= b {
    m := a;
  } else {
    m := b;
  } 
}
