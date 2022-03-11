import 'package:flutter/material.dart';
import 'package:validus_coin/viewmodels/get_stocks_viewmodel.dart';

import '../../models/stock_model.dart';
import '../../models/stocks_model.dart';
import '../widgets/page_title.dart';
import '../widgets/stock_card.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const PageTitle('My watchlist'),
                  FutureBuilder(
                    builder: (context, AsyncSnapshot<Stocks> snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data?.data.length,
                            itemBuilder: (context, idx) {
                              Stock stock = snapshot.data!.data[idx];
                              return StockCard(stock);
                            },
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    future: getStocks(),
                  ),
                ],
              ),
            ),
          );
  }
}
