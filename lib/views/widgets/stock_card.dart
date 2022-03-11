import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/stock_model.dart';

const data =
    '{"id": "87-3221807","stockName": "Buzzshare","price": 65.53,"dayGain": 3.76,"lastTrade": "1636275300000","extendedHours": "1639008000000","lastPrice": 90.23}';

final Stock stock = Stock.fromJson(data);

class StockCard extends StatelessWidget {
  final Stock stock;
  const StockCard(this.stock, {Key? key}) : super(key: key);

  String changePercent(lastPrice, price) {
    return lastPrice - price >= 0
        ? '+' + ((lastPrice - price) * 100 / lastPrice).toStringAsFixed(1) + '%'
        : '' + ((lastPrice - price) * 100 / lastPrice).toStringAsFixed(1) + '%';
  }

  Color changeColor(lastPrice, price) {
    return (lastPrice - price) >= 0
        ? const Color(0xFF1ACC81)
        : const Color(0xFFE22716);
  }

  Icon changePercentIcon(lastPrice, price) {
    return (lastPrice - price) >= 0
        ? const Icon(
            Icons.arrow_drop_up,
            color: Color(0xFF1ACC81),
          )
        : const Icon(Icons.arrow_drop_down, color: Color(0xFFE22716));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stock.stockName.toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: const Color(0xFFD2D2D2))),
                Text(stock.price.toString())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Day gain',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: const Color(0xFFD2D2D2))),
                Text(stock.dayGain.toString())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Last trade',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: const Color(0xFFD2D2D2))),
                Text(DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(
                    int.parse(stock.lastTrade))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Extends',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: const Color(0xFFD2D2D2))),
                Text(DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(
                    int.parse(stock.extendedHours))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('% Change',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: const Color(0xFFD2D2D2))),
                Row(
                  children: [
                    changePercentIcon(stock.lastPrice, stock.price),
                    Text(
                      changePercent(stock.lastPrice, stock.price),
                      style: TextStyle(
                          color: changeColor(stock.lastPrice, stock.price)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
