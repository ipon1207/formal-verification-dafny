method Clamp(x: int, lo: int, hi: int) returns (r: int)
  requires lo <= hi
  ensures lo <= r <= hi
  ensures lo <= x <= hi ==> r == x
  ensures x < lo ==> r == lo
  ensures x > hi ==> r == hi
{
  if x < lo {
    r := lo;
  } else if x > hi {
    r := hi;
  } else {
    r := x;
  }
}

method UseClamp()
{
  var r := Clamp(5, 0, 10);
  assert r == 5;

  // var bad := Clamp(5, 10, 0);
  // ↑ コメントを外すと「事前条件 lo <= hi を満たさない呼び出し」としてここでエラーになる
}
