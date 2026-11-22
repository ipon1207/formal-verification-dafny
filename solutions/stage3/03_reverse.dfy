method Reverse(a: array<int>)
  modifies a
  ensures forall k :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
{
  var i := 0;
  while i < a.Length / 2
    invariant 0 <= i <= a.Length / 2
    // 左端から i 個と右端から i 個は入れ替え済み
    invariant forall k :: 0 <= k < i ==> a[k] == old(a[a.Length - 1 - k])
    invariant forall k :: 0 <= k < i ==> a[a.Length - 1 - k] == old(a[k])
    // 真ん中はまだ元のまま
    invariant forall k :: i <= k < a.Length - i ==> a[k] == old(a[k])
  {
    a[i], a[a.Length - 1 - i] := a[a.Length - 1 - i], a[i];
    i := i + 1;
  }
}
