enum BxWithdrawTransactionType { PENDING, CANCELED, COMPLETED }


String fromBxWithdrawTransactionTypeToString(BxWithdrawTransactionType type) {
  if (type == BxWithdrawTransactionType.PENDING) {
    return "Pending";
  }
  else if (type == BxWithdrawTransactionType.CANCELED) {
    return "Canceled";
  }
  else if (type == BxWithdrawTransactionType.COMPLETED) {
    return "Completed";
  }


  return "";
}

BxWithdrawTransactionType fromStringToBxWithdrawTransactionType(String str) {
  str = str.toLowerCase().trim();
  if (str == "pending") {
    return BxWithdrawTransactionType.PENDING;
  }
  else if (str == "canceled") {
    return BxWithdrawTransactionType.CANCELED;
  }
  else if (str == "completed") {
    return BxWithdrawTransactionType.COMPLETED;
  }

  return null;
}