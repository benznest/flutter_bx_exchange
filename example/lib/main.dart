import 'package:flutter/material.dart';
import 'package:flutter_bx_exchange/bx_exchange_service.dart';
import 'package:flutter_bx_exchange/bx_trade_type.dart';
import 'package:flutter_bx_exchange/bx_transaction_type.dart';
import 'package:flutter_bx_exchange/dao/apiKey/bx_api_key.dart';
import 'package:flutter_bx_exchange/dao/current_pairings/bx_pair_curency_meta_dao.dart';
import 'package:flutter_bx_exchange/dao/get_deposit_address/bx_deposit_address_dao.dart';
import 'package:flutter_bx_exchange/dao/get_order/bx_open_order_response_dao.dart';
import 'package:flutter_bx_exchange/dao/market_data/bx_pair_currency_dao.dart';
import 'package:flutter_bx_exchange/dao/withdraw_history/bx_withdraw_history_dao.dart';

Future main() async {
  var bx = BxExchangeService(
    apiKeyGeneral: BxApiKey(apiKey: "893fc899cfdc", secret: "0f3c0c0e8687"),
    apiKeyCreateOrder: BxApiKey(apiKey: "ac10eb8b24d0", secret: "79ec3bdc1648"),
    apiKeyCancelOrder: BxApiKey(apiKey: "ac10eb8b24d0", secret: "79ec3bdc1648"),
  );

//  List<BxPairCurrencyBxDao> list = await bx.fetchMarketData(printJson: true);
//  for(var currency in list){
//    currency.pairingId;
//    currency.primaryCurrency;
//    currency.secondaryCurrency;
//    currency.lastPrice;
//    currency.volume24hours;
//    currency.orderbook;
//  }

//  List<BxPairCurrencyMetaDao> list = await bx.fetchCurrentPairings(printJson: true);
//    for(var currency in list){
//    currency.pairingId;
//    currency.primaryCurrency;
//    currency.secondaryCurrency;
//    currency.active;
//    currency.primaryMin;
//  }

//  var orderbook = await bx.fetchOrderBook(pairingId: 1);
//  orderbook.pairingsId;
//  orderbook.asks;
//  orderbook.bids;

//  var recent = await bx.fetchRecentTrade(pairingId: 1);
//  recent.pairingId;
//  recent.highBid;
//  recent.lowAsk;
//  recent.trades;

//  var history = await bx.fetchHistoricalTradeData(pairingId: 1, date: "2019-07-01", printJson: true);
//  history.high;
//  history.low;
//  history.avg;
//  history.open;
//  history.volume;

//  var response = await bx.fetchBalance();
//  if(response.success){
//    var balances = response.balance;
//    for(var balance in balances.listBalanceCurrency){
  //  balance.currency;
  //  balance.available;
  //  balance.deposits;
  //  balance.orders;
  //  balance.total;
  //  balance.withdrawals;
//    }
//  }else{
//    print(response.error);
//  }

//  var response = await bx.fetchOpenOrders(pairingId: 1, orderType: BxTradeType.SELL);
//    if(response.success){
//    for(var order in response.orders){
  //  order.pairingId;
  //  order.orderId;
  //  order.orderType;
  //  order.rate;
  //  order.amount;
  //  order.date;
//    }
//  }else{
//    print(response.error);
//  }

//  var response = await bx.fetchTransactionHistory(currency: "BTC", transactionType: BxTransactionType.WITHDRAW, startDate: "2019-01-01", endDate: "2019-05-01");
//  if (response.success) {
//    for (var tx in response.transactions) {
      //  tx.currency;
      //  tx.amount;
      //  tx.transactionId;
      //  tx.date;
      //  tx.type;
      //  tx.refId;
//    }
//  } else {
//    print(response.error);
//  }

  var response  = await bx.fetchWithdrawHistory();
  if(response.success){
    for(var tx in response.withdrawals){
      //  tx.transactionId;
      //  tx.currency;
      //  tx.amount;
      //  tx.address;
      //  tx.dateRequested;
      //  tx.withdrawalId;
      //  tx.withdrawalStatus;
    }
  }else{
    //  print(response.error);
  }





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
