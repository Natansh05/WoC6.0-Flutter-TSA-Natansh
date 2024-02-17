import 'package:flutter/material.dart';
import 'dart:convert';

class Qoute{
  String? exchange;
  String? shortname;
  String? symbol;
  String? qouteType;
  String? index;
  int? score;
  String? typeDisp;
  String? longname;
  String? exchDisp;

  Qoute(
  {
    required this.index,
    required this.exchange,
    required this.exchDisp,
    required this.longname,
    required this.qouteType,
    required this.score,
    required this.shortname,
    required this.symbol,
    required this.typeDisp,
});

  factory Qoute.fromMap(Map<String,dynamic> json){
    return Qoute(
      exchange: json['exchange'] as String,
      shortname: json['shortname'] as String,
      symbol: json['symbol'] as String,
      index: json['index'] as String,
      score: json['score'],
      typeDisp: json['typeDisp'] as String,
      longname: json['longname'] as String,
      exchDisp: json['exchDisp'] as String,
      qouteType: json['qouteType'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exchange': exchange,
      'shortname': shortname,
      'symbol': symbol,
      'qouteType': qouteType,
      'index': index,
      'typeDisp': typeDisp,
      'longname': longname,
      'score': score.toString(),
      'exchDisp' : exchDisp
    };
  }
  String toJson() => json.encode(toMap());


  factory Qoute.fromJson(String source){
    return Qoute.fromMap(json.decode(source) as Map<String,dynamic>);
}





}