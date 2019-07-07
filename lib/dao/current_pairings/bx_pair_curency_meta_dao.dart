class BxPairCurrencyMetaDao {
  int pairingId;
  String primaryCurrency;
  String secondaryCurrency;
  double primaryMin;
  double secondaryMin;
  bool active;

  BxPairCurrencyMetaDao({this.pairingId,
    this.primaryCurrency,
    this.secondaryCurrency,
    this.primaryMin,
    this.secondaryMin,
    this.active});

  BxPairCurrencyMetaDao.fromJson(Map<String, dynamic> json) {
    pairingId = int.parse(json['pairing_id'].toString());
    primaryCurrency = json['primary_currency'];
    secondaryCurrency = json['secondary_currency'];
    primaryMin = double.parse(json['primary_min'].toString());
    secondaryMin = double.parse(json['secondary_min'].toString());
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pairing_id'] = this.pairingId;
    data['primary_currency'] = this.primaryCurrency;
    data['secondary_currency'] = this.secondaryCurrency;
    data['primary_min'] = this.primaryMin;
    data['secondary_min'] = this.secondaryMin;
    data['active'] = this.active;
    return data;
  }
}