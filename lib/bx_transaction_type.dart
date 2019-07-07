enum BxTransactionType { ALL, TRADE, FEE, DEPOSIT, WITHDRAW }


String bxTransactionTypeToString(BxTransactionType type) {
  if (type == BxTransactionType.TRADE) {
    return "trade";
  }
  else if (type == BxTransactionType.FEE) {
    return "fee";
  }
  else if (type == BxTransactionType.DEPOSIT) {
    return "deposit";
  }
  else if (type == BxTransactionType.WITHDRAW) {
    return "withdraw";
  }

  return "";
}