// ステージ2-3：配列の最大要素（本体も不変条件も自分で書く）
// ゴール：本体と invariant を書いて検証を通す
//
// ヒント
// - ensures の2行（全要素以下・どれかと等しい）それぞれに対応する不変条件が要る
// - exists を不変条件に入れるのは少し難しい。詰まったら「m は a[0..i) のどれかと等しい」を
//   そのまま式にしてみる

method MaxElement(a: array<int>) returns (m: int)
  requires a.Length > 0
  ensures forall k :: 0 <= k < a.Length ==> a[k] <= m
  ensures exists k :: 0 <= k < a.Length && a[k] == m
{
  // TODO
}
