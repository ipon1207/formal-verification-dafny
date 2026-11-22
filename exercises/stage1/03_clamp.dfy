// ステージ1-3：値を範囲内に収める（requires＝事前条件の体験）
// ゴール
// 1. Clamp の本体を書いて検証を通す
// 2. UseClamp の中のコメントアウトを外し、どこでエラーになるか確かめる
//
// ポイント
// - requires は「呼び出す側が守る約束」
// - だから Clamp の中では lo <= hi を前提にでき、守れていない呼び出しは呼び出し側でエラーになる

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

  // var bad := Clamp(5, 10, 0);  // コメントを外すとどうなる？
}
