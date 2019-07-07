import 'package:flutter/material.dart';
import 'package:flutter_bx_exchange/bx_exchange_service.dart';
import 'package:flutter_bx_exchange/bx_trade_type.dart';
import 'package:flutter_bx_exchange/dao/apiKey/bx_api_key.dart';
import 'package:flutter_bx_exchange/dao/get_deposit_address/bx_deposit_address_dao.dart';
import 'package:flutter_bx_exchange/dao/get_order/bx_open_order_response_dao.dart';
import 'package:flutter_bx_exchange/dao/withdraw_history/bx_withdraw_history_dao.dart';

Future main() async {
  BxExchangeService bx = BxExchangeService(
    apiKeyGeneral: BxApiKey(apiKey: "893fc899cfdc", secret: "0f3c0c0e8687"),
    apiKeyCreateOrder: BxApiKey(apiKey: "ac10eb8b24d0", secret: "79ec3bdc1648"),
    apiKeyCancelOrder: BxApiKey(apiKey: "ac10eb8b24d0", secret: "79ec3bdc1648"),
  );

//  await service.fetchMarketData(printJson: true);
//  await service.fetchCurrentPairings(printJson: true);
//  await service.fetchOrderBook(pairingId: 1, printJson: true);
//  await service.fetchRecentTrade(pairingId: 1, printJson: true);
//  await service.fetchHistoricalTradeData(pairingId: 1, date: "2019-07-01", printJson: true);
//  await service.fetchBalance(printJson: true);
//  BxOpenOrderResponseDao orders = await service.fetchOpenOrders(pairingId: 1, type: BxTradeType.SELL, printJson: true);
//  await service.fetchTransactionHistory(startDate: "2019-10-10", printJson: true);
//  BxWithdrawHistoryDao withdrawHistory = await service.fetchWithdrawHistory(printJson: true);
//  BxDepositAddressDao depositAddress = await service.fetchDepositAddress(currency: "BTC", printJson: true);
//  await service.createOrder(pairingId: 1,
//      tradeType: BxTradeType.SELL,
//      amount: 0.001,
//      rate: 1000000,
//      twoFactorAuth: '150812',
//      printJson: true);
//  await bx.cancelOrder(pairingId: 1,
//      orderId: 12859851,
//      twoFactorAuth: '570265',
//      printJson: true);
//  print(depositAddress.toJson());
//  print(orders.toJson());
//  service.printSignature();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  List<BxPairCurrencyBxDao> listPairCurrency;
//  BxExchangeService service = BxExchangeService();

  @override
  void initState() {
//    listPairCurrency = List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FLUTTER BX'),
        ),
        body: Container(),
//        body: FutureBuilder(future: service.fetchCurrentPairings(),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                listPairCurrency = snapshot.data;
//                return buildDataMarketListView();
//              }
//              else if (snapshot.hasError) {
//                print(snapshot.error);
//                return Center(child: Text("Error"));
//              } else {
//                return Center(child: CircularProgressIndicator());
//              }
//            }),
      ),
    );
  }

//  Widget buildDataMarketListView() {
//    return ListView.builder(
//        itemCount: listPairCurrency.length,
//        itemBuilder: (context, index) {
//          return buildRowPairCurrency(listPairCurrency[index]);
//        });
//  }
//
//  Widget buildRowPairCurrency(BxPairCurrencyBxDao pair) {
//    return Text("${pair.primaryCurrency}/${pair.secondaryCurrency}");
//  }
}
