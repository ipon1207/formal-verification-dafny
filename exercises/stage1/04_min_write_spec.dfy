// ステージ1-4：仕様を書く側に回る
// 今度は実装が先にあり、仕様（ensures）が空っぽ
// ゴール：この実装の性質を言い当てる ensures を自分で書く
//
// 判定基準
// - 検証が通ること
// - 本体を `m := a - 1000;` のような間違った実装に変えたら、検証が失敗すること
//   （失敗しないなら、仕様が弱すぎる）

method Min(a: int, b: int) returns (m: int)
  ensures a == m || b == m
  ensures a >= m && b >= m
{
  if a < b {
    m := a;
  } else {
    m := b;
  }
}
