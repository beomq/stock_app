import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StockApi {
  final baseUrl = 'https://www.alphavantage.co';
  final apiKey = dotenv.env['ALPHA_VANTAGE_API_KEY'];

  final http.Client client;

  StockApi(this.client);

  Future<http.Response> getListings(String apiKey) async {
    return await client.get(
        Uri.parse('$baseUrl/query?function=LISTING_STATUS&apiKEY=$apiKey'));
  }
}
