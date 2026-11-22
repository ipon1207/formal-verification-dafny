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
    invariant 0 <= i <= a.Length
    invariant s == SumTo(a[..], i)
  {
    s := s + a[i];
    i := i + 1;
  }
}
