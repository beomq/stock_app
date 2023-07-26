import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/data/source/remote/dto/company_info_dto.dart';

class StockApi {
  final String baseUrl = 'https://www.alphavantage.co';
  final String? apiKey = dotenv.env['ALPHA_VANTAGE_API_KEY'];

  final http.Client _client;

  StockApi({http.Client? client}) : _client = (client ?? http.Client());

  Future<http.Response> getListings({String? apiKey}) async {
    String usedApiKey = apiKey ?? this.apiKey ?? '';
    return await _client.get(
        Uri.parse('$baseUrl/query?function=LISTING_STATUS&apikey=$usedApiKey'));
  }

  Future<CompanyInfoDto> getCompanyInfo({
    required String symbol,
    String? apiKey,
  }) async {
    String usedApiKey = apiKey ?? this.apiKey ?? '';
    final response = await _client.get(Uri.parse(
        '$baseUrl/query?function=OVERVIEW&symbol=$symbol&apikey=$usedApiKey'));

    return CompanyInfoDto.fromJson(jsonDecode(response.body));
  }

  Future<http.Response> getIntradayInfo(
      {required String symbol, String? apiKey}) async {
    String usedApiKey = apiKey ?? this.apiKey ?? '';
    return await _client.get(Uri.parse(
        '$baseUrl/query?function=TIME_SERIES_INTRADAY&symbol=$symbol&interval=60min&apikey=$usedApiKey&datatype=csv'));
  }
}
