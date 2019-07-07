class BxTransactionDetailDao {
  int transactionId;
  String currency;
  double amount;
  String date;
  String type;
  String refId;

  BxTransactionDetailDao({this.transactionId,
    this.currency,
    this.amount,
    this.date,
    this.type,
    this.refId});

  BxTransactionDetailDao.fromJson(Map<String, dynamic> json) {
    transactionId = int.parse(json['transaction_id'].toString());
    currency = json['currency'];
    amount = double.parse(json['amount'].toString());
    date = json['date'];
    type = json['type'];
    refId = json['ref_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_id'] = this.transactionId;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['type'] = this.type;
    data['ref_id'] = this.refId;
    return data;
  }
}