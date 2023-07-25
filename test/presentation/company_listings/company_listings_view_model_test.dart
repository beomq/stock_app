import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:stock_app/data/repository/stock_repository_impl.dart';
import 'package:stock_app/data/source/local/company_listing_entity.dart';
import 'package:stock_app/data/source/local/stock_dao.dart';
import 'package:stock_app/data/source/remote/stock_api.dart';
import 'package:stock_app/presentation/company_listings/company_listings_view_model.dart';

void main() {
  test('company_listings_view_model_test', () async {
    Hive.init(null);
    Hive.registerAdapter(CompanyListingEntityAdapter());
    await dotenv.load(fileName: 'test/.env'); // .env.test 파일을 로드하도록 설정

    final _api = StockApi();
    final _dao = StockDao();
    final viewModel = CompanyListingsViewModel(StockRepositoryImpl(_api, _dao));

    await Future.delayed(Duration(seconds: 3));

    expect(viewModel.state.companies.isNotEmpty, true);
  });
}
