import 'package:flutter/material.dart';
import 'package:flutter_bx_exchange/bx_exchange_service.dart';
import 'package:flutter_bx_exchange/dao/bx_pair_currency_dao.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<BxPairCurrencyBxDao> listPairCurrency;
  BxExchangeService service = BxExchangeService();

  @override
  void initState() {
    listPairCurrency = List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FLUTTER BX'),
        ),
        body: FutureBuilder(future: service.fetchMarketData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                listPairCurrency = snapshot.data;
                return buildDataMarketListView();
              }
              else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Error"));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Widget buildDataMarketListView() {
    return ListView.builder(
      itemCount: listPairCurrency.length,
    itemBuilder: (context,index){
      return buildRowPairCurrency(listPairCurrency[index]);
    });
  }

  Widget buildRowPairCurrency(BxPairCurrencyBxDao pair) {
    return Text("${pair.primaryCurrency}/${pair.secondaryCurrency}");
  }
}
