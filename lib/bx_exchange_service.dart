import 'dart:async';
import 'dart:convert';
import 'package:flutter_bx_exchange/dao/bx_market_data_dao.dart';
import 'package:flutter_bx_exchange/dao/bx_pair_currency_dao.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BxExchangeService {

  static const String URL_DATA_MARGET = "https://bx.in.th/api/";

  ///
  /// get market data from ticker as price , volume in 24 hr , change in 24 hr.
  /// this is a public api.
  ///
  Future<List<BxPairCurrencyBxDao>> fetchMarketData() async {
    Response response = await http.get(URL_DATA_MARGET);
    final responseJson = json.decode(response.body);
    BxMarketDataDao dataMarket = BxMarketDataDao.fromJson(responseJson);
    return dataMarket.toList();
  }


}
