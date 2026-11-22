method Min(a: int, b: int) returns (m: int)
  ensures m <= a && m <= b   // どちらよりも大きくない
  ensures m == a || m == b   // どちらかと等しい（これが無いと m := a - 1000; も通る）
{
  if a < b {
    m := a;
  } else {
    m := b;
  }
}
