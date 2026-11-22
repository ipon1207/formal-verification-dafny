newtype int32 = x: int | -0x8000_0000 <= x < 0x8000_0000

method Midpoint(lo: int32, hi: int32) returns (mid: int32)
  requires 0 <= lo <= hi
  ensures lo <= mid <= hi
{
  // (lo + hi) は int32 の上限を超えうる（例：lo = hi = 0x7FFF_FFFF）
  // hi - lo は 0 以上 hi 以下なので、はみ出さない
  mid := lo + (hi - lo) / 2;
}
