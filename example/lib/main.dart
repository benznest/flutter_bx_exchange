import 'package:flutter/material.dart';
import 'package:flutter_bx_exchange/bx_exchange_service.dart';
import 'package:flutter_bx_exchange/dao/apiKey/bx_api_key.dart';

Future main() async {
  // TODO : Please provide API Key.
  var bx = BxExchangeService(
    apiKeyGeneral: BxApiKey(apiKey: "123456789", secret: "123456789"),
    apiKeyCreateOrder: BxApiKey(apiKey: "-", secret: "-"),
    apiKeyCancelOrder: BxApiKey(apiKey: "-", secret: "-"),
  );

  bx.printSignature(BxApiKey(apiKey: "123456789", secret: "123456789"));

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
