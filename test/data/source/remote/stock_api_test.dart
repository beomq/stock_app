import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_app/data/csv/company_listing_parser.dart';
import 'package:stock_app/data/source/remote/stock_api.dart';

void main() {
  group('StockApi', () {
    setUpAll(() async {
      await dotenv.load(fileName: 'test/.env'); // .env.test 파일을 로드하도록 설정
    });

    test('getListings returns a response', () async {
      final response = await StockApi().getListings();
      final _parser = CompanyListingsParser();
      final remoteListings = await _parser.parse(response.body);
      expect(remoteListings[0].symbol, 'A');
      expect(remoteListings[0].exchange, 'NYSE');
    });
  });
}
