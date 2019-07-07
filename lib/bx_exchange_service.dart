import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bx_exchange/bx_auth_utils.dart';
import 'package:flutter_bx_exchange/bx_trade_type.dart';
import 'package:flutter_bx_exchange/bx_transaction_type.dart';
import 'package:flutter_bx_exchange/dao/apiKey/bx_api_key.dart';
import 'package:flutter_bx_exchange/dao/balance/bx_balance_response_dao.dart';
import 'package:flutter_bx_exchange/dao/cancel_order/bx_cancel_order_response_dao.dart';
import 'package:flutter_bx_exchange/dao/create_order/bx_cretae_order_response_dao.dart';
import 'package:flutter_bx_exchange/dao/get_deposit_address/bx_deposit_address_dao.dart';
import 'package:flutter_bx_exchange/dao/get_order/bx_open_order_response_dao.dart';
import 'package:flutter_bx_exchange/dao/historical_trade_data/bx_historical_trade_data_dao.dart';
import 'package:flutter_bx_exchange/dao/historical_trade_data/bx_historical_trade_data_response_dao.dart';
import 'package:flutter_bx_exchange/dao/market_data/bx_market_data_dao.dart';
import 'package:flutter_bx_exchange/dao/market_data/bx_pair_currency_dao.dart';
import 'package:flutter_bx_exchange/dao/current_pairings/bx_pair_curency_meta_dao.dart';
import 'package:flutter_bx_exchange/dao/current_pairings/bx_current_pairings_dao.dart';
import 'package:flutter_bx_exchange/dao/order_book/bx_order_book_dao.dart';
import 'package:flutter_bx_exchange/dao/recent_trade/bx_recent_trade_dao.dart';
import 'package:flutter_bx_exchange/dao/transaction_history/bx_transaction_history_dao.dart';
import 'package:flutter_bx_exchange/dao/withdraw_history/bx_withdraw_history_dao.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BxExchangeService {
  static const String BASE_URL = "bx.in.th";
  static const String POINT_API = "api/";

  /// Header content-type
  static const String FORM_URL_ENCODED = "application/x-www-form-urlencoded";

  /// Public API
  static const String END_POINT_DATA_MARGET = "";
  static const String END_POINT_CURRENT_PAIRINGS = "pairing/";
  static const String END_POINT_ORDER_BOOK = "orderbook/";
  static const String END_POINT_RECENT_TRADE = "trade/";

  /// Private API
  static const String END_POINT_BALANCE = "balance/";
  static const String END_POINT_OPEN_ORDER = "getorders/";
  static const String END_POINT_TRANSACTIONS_HISTORY = "history/";
  static const String END_POINT_HISTORICAL = "tradehistory/";
  static const String END_POINT_WITHDRAW_HISTORY = "withdrawal-history/";
  static const String END_POINT_GET_DEPOSIT_ADDRESS = "deposit/";
  static const String END_POINT_CREATE_ORDER = "order/";
  static const String END_POINT_CANCEL_ORDER = "cancel/";

  ///
  /// Api key for get general data.
  /// Required permission
  /// [Balances] for get data balance and transaction history.
  /// [Deposit] for get deposit address on wallet.
  /// Recommend [disable] 2FA on this key.
  ///
  BxApiKey apiKeyGeneral;

  ///
  /// Api key for creating order.
  /// Required permission
  /// [CreateOrder] for creating order.
  /// Recommend [enable] 2FA on this key for more security.
  ///
  BxApiKey apiKeyCreateOrder;

  ///
  /// Api key for canceling order.
  /// Required permission
  /// [CancelOrder] for canceling order.
  /// Recommend [enable] 2FA on this key for more security.
  ///
  BxApiKey apiKeyCancelOrder;


  BxExchangeService({this.apiKeyGeneral, this.apiKeyCreateOrder, this.apiKeyCancelOrder});

  ///
  /// print nonce and signature for testing.
  ///
  void printSignature() {
    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyGeneral, nonce).toString();
    print("apiKey = ${apiKeyGeneral.apiKey}");
    print("nonce = $nonce");
    print("signature = " + signature);
  }

  ///
  /// This is a public api.
  /// Returns a list of all currency pairings including
  /// symbol currency, current price, volume in 24 hr, change in 24 hr.
  ///
  Future<List<BxPairCurrencyBxDao>> fetchMarketData({bool printJson = false}) async {
    String url = Uri.https(BASE_URL, POINT_API + END_POINT_DATA_MARGET).toString();
    Response response = await http.get(url);
    final responseJson = json.decode(response.body);
    BxMarketDataDao dataMarket = BxMarketDataDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print(dataMarket.toJson());
    }
    return dataMarket.data;
  }

  ///
  /// This is a public api.
  /// Returns a list of all available currency pairings,
  /// including their "pairing_id" which is required for some API calls. Will also include
  /// the minimum order amount for primary and secondary currency in each pairing market.
  ///
  Future<List<BxPairCurrencyMetaDao>> fetchCurrentPairings({bool printJson = false}) async {
    String url = Uri.https(BASE_URL, POINT_API + END_POINT_CURRENT_PAIRINGS).toString();
    Response response = await http.get(url);
    final responseJson = json.decode(response.body);
    BxCurrentPairingsDao currentPairings = BxCurrentPairingsDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print(currentPairings.toJson());
    }
    return currentPairings.data;
  }

  ///
  /// This is a public api.
  /// Returns a list of all buy and sell orders in the order book for the selected pairing market.
  ///
  Future<BxOrderBookDao> fetchOrderBook({int pairingId = 1, bool printJson = false}) async {
    String url = Uri.https(BASE_URL, POINT_API + END_POINT_ORDER_BOOK, {"pairing": "$pairingId"}).toString();
    Response response = await http.get(url);
    final responseJson = json.decode(response.body);
    BxOrderBookDao orderBook = BxOrderBookDao.fromJson(pairingId, responseJson);
    if (printJson) {
      print(url);
      print(orderBook.toJson());
    }
    return orderBook;
  }

  ///
  /// This is a public api.
  /// Returns a list of 10 most recent trades, and top 10 asks and bids in order book.
  ///
  Future<BxRecentTradeDao> fetchRecentTrade({int pairingId = 1, bool printJson = false}) async {
    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_RECENT_TRADE, {"pairing": "$pairingId"})
        .toString();
    Response response = await http.get(url);
    final responseJson = json.decode(response.body);
    BxRecentTradeDao recentTrade = BxRecentTradeDao.fromJson(pairingId, responseJson);
    if (printJson) {
      print(url);
      print(recentTrade.toJson());
    }
    return recentTrade;
  }

  ///
  /// This is a public api.
  /// Returns Weighted Average, Volume, Open, Close, Low and High prices for the specified date.
  ///
  Future<BxHistoricalTradeDataDao> fetchHistoricalTradeData({
    int pairingId = 1,
    @required String date,
    bool printJson = false}) async {
    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_HISTORICAL, {"pairing": "$pairingId", "date": date})
        .toString();
    Response response = await http.get(url);
    final responseJson = json.decode(response.body);
    BxHistoricalTradeDataResponseDao responseHistorical = BxHistoricalTradeDataResponseDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print(responseHistorical.toJson());
    }

    return responseHistorical.data;
  }

  ///
  /// This is a private api.
  /// Returns current balance all currencies.
  /// require permission [balance]
  ///
  Future<BxBalanceResponseDao> fetchBalance({String twoFactorAuth = "", bool printJson = false}) async {
    validateGeneralApiKey();

    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_BALANCE)
        .toString();

    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyGeneral, nonce).toString();
    Response response = await http.post(url,
        headers: {
          "Content-Type": FORM_URL_ENCODED},
        body: {
          "key": apiKeyGeneral.apiKey,
          "nonce": "$nonce",
          "signature": "$signature",
          "twofa": "$twoFactorAuth"
        });

    final responseJson = json.decode(response.body);
    BxBalanceResponseDao responseBalance = BxBalanceResponseDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print("nonce = $nonce");
      print("signature = " + signature);
      print(responseJson);
    }

    return responseBalance;
  }

  ///
  /// This is a private api.
  /// Returns current orders with option BUY / SELL.
  /// require permission [balance]
  ///
  Future<BxOpenOrderResponseDao> fetchOpenOrders(
      {int pairingId = 1, BxTradeType orderType = BxTradeType.BUY, String twoFactorAuth = "", bool printJson = false}) async {
    validateGeneralApiKey();

    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_OPEN_ORDER)
        .toString();

    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyGeneral, nonce).toString();
    Response response = await http.post(url,
        headers: {
          "Content-Type": FORM_URL_ENCODED},
        body: {
          "key": apiKeyGeneral.apiKey,
          "nonce": "$nonce",
          "signature": "$signature",
          "twofa": "$twoFactorAuth",
          "pairing": "$pairingId",
          "type": orderType == BxTradeType.BUY ? "buy" : "sell",
        });

    final responseJson = json.decode(response.body);
    BxOpenOrderResponseDao responseGetOrder = BxOpenOrderResponseDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print("nonce = $nonce");
      print("signature = " + signature);
      print(responseJson);
    }

    return responseGetOrder;
  }

  ///
  /// This is a private api.
  /// Get your own balance affecting transaction history, such as trades, withdrawals and deposits.
  /// require permission [balance]
  ///
  Future<BxTransactionHistoryDao> fetchTransactionHistory({String currency = "", String startDate = "", String endDate = "",
    BxTransactionType transactionType = BxTransactionType.ALL, String twoFactorAuth = "", bool printJson = false}) async {
    validateGeneralApiKey();

    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_TRANSACTIONS_HISTORY)
        .toString();

    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyGeneral, nonce).toString();
    Response response = await http.post(url,
        headers: {
          "Content-Type": FORM_URL_ENCODED},
        body: {
          "key": apiKeyGeneral.apiKey,
          "nonce": "$nonce",
          "signature": "$signature",
          "twofa": "$twoFactorAuth",
          "currency": "$currency",
          "type": bxTransactionTypeToString(transactionType),
          "start_date": startDate,
          "end_date": endDate
        });

    final responseJson = json.decode(response.body);
    BxTransactionHistoryDao responseHistory = BxTransactionHistoryDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print("nonce = $nonce");
      print("signature = " + signature);
      print(responseJson);
    }

    return responseHistory;
  }

  ///
  /// This is a private api.
  /// Return all transactions that about withdrawal.
  /// require permission [balance]
  ///
  Future<BxWithdrawHistoryDao> fetchWithdrawHistory({String twoFactorAuth = "", bool printJson = false}) async {
    validateGeneralApiKey();

    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_WITHDRAW_HISTORY)
        .toString();

    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyGeneral, nonce).toString();
    Response response = await http.post(url,
        headers: {
          "Content-Type": FORM_URL_ENCODED},
        body: {
          "key": apiKeyGeneral.apiKey,
          "nonce": "$nonce",
          "signature": "$signature",
          "twofa": "$twoFactorAuth"
        });

    final responseJson = json.decode(response.body);
    BxWithdrawHistoryDao responseWithdrawHistory = BxWithdrawHistoryDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print("nonce = $nonce");
      print("signature = " + signature);
      print(responseJson);
    }

    return responseWithdrawHistory;
  }

  ///
  /// This is a private api.
  /// Return deposit address of wallet.
  /// require permission [deposit]
  ///
  Future<BxDepositAddressDao> fetchDepositAddress(
      {@required String currency, bool generateNewAddress = false, String twoFactorAuth = "", bool printJson = false}) async {
    validateGeneralApiKey();

    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_GET_DEPOSIT_ADDRESS)
        .toString();

    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyGeneral, nonce).toString();
    Response response = await http.post(url,
        headers: {
          "Content-Type": FORM_URL_ENCODED},
        body: {
          "key": apiKeyGeneral.apiKey,
          "nonce": "$nonce",
          "signature": "$signature",
          "twofa": "$twoFactorAuth",
          "currency": "$currency",
          "new": "$generateNewAddress",
        });

    final responseJson = json.decode(response.body);
    BxDepositAddressDao responseDepositAddress = BxDepositAddressDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print("nonce = $nonce");
      print("signature = " + signature);
      print(responseJson);
    }

    return responseDepositAddress;
  }

  ///
  /// This is a private api.
  /// Create order to market.
  /// require permission [createOrder]
  ///
  Future<BxCreateOrderResponseDao> createOrder(
      {@required int pairingId, @required BxTradeType tradeType, @required double amount, @required double rate,
        String twoFactorAuth = "", bool printJson = false}) async {
    validateCreateOrderApiKey();

    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_CREATE_ORDER)
        .toString();

    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyCreateOrder, nonce).toString();
    Response response = await http.post(url,
        headers: {
          "Content-Type": FORM_URL_ENCODED},
        body: {
          "key": apiKeyCreateOrder.apiKey,
          "nonce": "$nonce",
          "signature": "$signature",
          "twofa": "$twoFactorAuth",
          "pairing": "$pairingId",
          "type": fromBxTradeTypeToString(tradeType),
          "amount": "$amount",
          "rate": "$rate",
        });

    final responseJson = json.decode(response.body);
    BxCreateOrderResponseDao responseCreateOrder = BxCreateOrderResponseDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print("nonce = $nonce");
      print("signature = " + signature);
      print(responseJson);
    }

    return responseCreateOrder;
  }

  ///
  /// This is a private api.
  /// Cancel order / Remove order from market.
  /// require permission [cancelOrder]
  ///
  Future<BxCancelOrderResponseDao> cancelOrder(
      {@required int pairingId, @required int orderId,
        String twoFactorAuth = "", bool printJson = false}) async {
    validateCancelOrderApiKey();

    String url = Uri
        .https(BASE_URL, POINT_API + END_POINT_CANCEL_ORDER)
        .toString();

    int nonce = BxAuthUtils.getNonce();
    String signature = BxAuthUtils.generateSignature(apiKeyCancelOrder, nonce).toString();
    Response response = await http.post(url,
        headers: {
          "Content-Type": FORM_URL_ENCODED},
        body: {
          "key": apiKeyCancelOrder.apiKey,
          "nonce": "$nonce",
          "signature": "$signature",
          "twofa": "$twoFactorAuth",
          "pairing": "$pairingId",
          "order_id": "$orderId",
        });

    final responseJson = json.decode(response.body);
    BxCancelOrderResponseDao responseCancelOrder = BxCancelOrderResponseDao.fromJson(responseJson);
    if (printJson) {
      print(url);
      print("nonce = $nonce");
      print("signature = " + signature);
      print(responseJson);
    }

    return responseCancelOrder;
  }

  void validateGeneralApiKey() {
    assert(apiKeyGeneral != null, "General API key must not null.");
    assert(apiKeyGeneral.apiKey.isNotEmpty && apiKeyGeneral.secret.isNotEmpty, "API key and Secret must not empty.");
  }

  void validateCreateOrderApiKey() {
    assert(apiKeyCreateOrder != null, "Create Order API key must not null.");
    assert(apiKeyCreateOrder.apiKey.isNotEmpty && apiKeyCreateOrder.secret.isNotEmpty, "API key and Secret must not empty.");
  }

  void validateCancelOrderApiKey() {
    assert(apiKeyCancelOrder != null, "The Canceling API key must not null.");
    assert(apiKeyCancelOrder.apiKey.isNotEmpty && apiKeyCancelOrder.secret.isNotEmpty, "API key and Secret must not empty.");
  }

}
