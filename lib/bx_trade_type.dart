enum BxTradeType { BUY, SELL }

BxTradeType fromStringToBxTradeType(String str) {
  str = str.toLowerCase().trim();
  if (str == "buy") {
    return BxTradeType.BUY;
  }
  return BxTradeType.SELL;
}

String fromBxTradeTypeToString(BxTradeType type) {
  if (type == BxTradeType.BUY) {
    return "buy";
  }
  return "sell";
}