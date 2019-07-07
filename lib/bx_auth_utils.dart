import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_bx_exchange/dao/apiKey/bx_api_key.dart';

class BxAuthUtils {
  static int getNonce() {
    return DateTime
        .now()
        .millisecondsSinceEpoch;
  }

  static Digest generateSignature(BxApiKey key, int nonce,) {
    String data = "${key.apiKey}$nonce${key.secret}";
    var bytes = utf8.encode(data);
    Digest digest = sha256.convert(bytes);
    return digest;
  }
}