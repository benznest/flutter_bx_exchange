# Flutter BX Exchange 

Flutter BX Exchange is a library to call API of the bx.in.th.

## Installation
Add dependencies in pubspec.yaml

```bash
flutter_bx_exchange: 1.0.0
```

## Usage

Import the package to your project.

```dart
import 'package:flutter_bx_exchange/bx_exchange_service.dart';
```

Create instance without API Key. 

```dart
var bx = BxExchangeService();
```


### Market Data (Ticker)

Returns a list of all currency pairings including symbol currency, current price, volume in 24 hr, change in 24 hr.

```dart
  List<BxPairCurrencyBxDao> list = await bx.fetchMarketData();
  for(var currency in list){
//    currency.pairingId;
//    currency.primaryCurrency;
//    currency.secondaryCurrency;
//    currency.lastPrice;
//    currency.volume24hours;
//    currency.orderbook;
  }
```

