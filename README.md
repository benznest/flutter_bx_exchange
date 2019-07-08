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


### Current Pairing Currency

Returns a list of all available currency pairings, including their "pairing_id" which is required for some API calls. Will also include the minimum order amount for primary and secondary currency in each pairing market.

```dart
  List<BxPairCurrencyMetaDao> list = await bx.fetchCurrentPairings();
for(var currency in list){
    //    currency.pairingId;
    //    currency.primaryCurrency;
    //    currency.secondaryCurrency;
    //    currency.active;
    //    currency.primaryMin;
  }
```