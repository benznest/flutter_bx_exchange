class BxBalanceCurrencyDao {
  String currency;
  double total;
  double available;
  double orders;
  double withdrawals;
  double deposits;
  double options;

  BxBalanceCurrencyDao({this.currency, this.total,
    this.available,
    this.orders,
    this.withdrawals,
    this.deposits,
    this.options});

  BxBalanceCurrencyDao.fromJson(this.currency, Map<String, dynamic> json) {
    total = double.parse(json['total'].toString());
    available = double.parse(json['available'].toString());
    orders = double.parse(json['orders'].toString());
    withdrawals = double.parse(json['withdrawals'].toString());
    deposits = double.parse(json['deposits'].toString());
    options = double.parse(json['options'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['available'] = this.available;
    data['orders'] = this.orders;
    data['withdrawals'] = this.withdrawals;
    data['deposits'] = this.deposits;
    data['options'] = this.options;
    return data;
  }

}