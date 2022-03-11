import 'package:validus_coin/models/stocks_model.dart';
import 'package:validus_coin/service/get_stocks_service.dart';

Future<Stocks> getStocks() async {
  String stocks = await getStocksService();
  Stocks temp = Stocks.fromJson(stocks);
  return temp;
}
