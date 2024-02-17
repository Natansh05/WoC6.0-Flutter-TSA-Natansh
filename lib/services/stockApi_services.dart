import 'dart:convert';
import 'package:http/http.dart' as http;

import '../src/features/authentication/models/stocks_model.dart';

class StocksApi {
  final _endPointUrl = Uri.https(
      "yh-finance.p.rapidapi.com",
      "/auto-complete",
      {"q": "BSE", "region": "IN"}
  );


  final _headers = {
    "X-Rapidapi-Key": "114f554406msh74095699fa15243p153924jsn26d8ea6deca1",
    "X-Rapidapi-Host": "yh-finance.p.rapidapi.com",
  };


  Future<List<Qoute>> getStock() async {
    try{
      final response = await http.get(_endPointUrl , headers: _headers);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final qouteData =
      List<Map<dynamic, dynamic>>.from(extractedData['qoutes']);


      final loadedQoutes = qouteData.map(
          (data)=> Qoute(
              index: data['index'] ?? "",
              exchange: data['exchange'],
              exchDisp: data['exchDisp'],
              longname: data['longname'],
              qouteType: data['qouteType'],
              score: data['score'],
              shortname: data['shortname'],
              symbol: data['symbol'],
              typeDisp: data['typeDisp']
          )
      ).toList();
      return loadedQoutes;
    } catch(error){
      rethrow;
    }
  }
}