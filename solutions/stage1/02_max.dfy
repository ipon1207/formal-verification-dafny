method Max(a: int, b: int) returns (m: int)
  ensures m >= a && m >= b
  ensures m == a || m == b
{
  if a > b {
    m := a;
  } else {
    m := b;
  }
}
