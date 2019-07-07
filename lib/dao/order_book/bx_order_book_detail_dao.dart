class BxOrderBookDetailDao{
  double rate;
  double amount;

  BxOrderBookDetailDao.fromJson(List<dynamic> list) {
    rate = double.parse(list[0].toString());
    amount = double.parse(list[1].toString());
  }

  List<String> toJson(){
    return ["$rate" , "$amount" ];
  }
}