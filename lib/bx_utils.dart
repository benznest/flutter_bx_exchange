
import 'dart:convert';
import 'package:flutter/material.dart';

void printPrettyJson(Map map) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(map);
  debugPrint(pretty);
}