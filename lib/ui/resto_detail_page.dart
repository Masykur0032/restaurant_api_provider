import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_sub2/data/api/api_service_detail.dart';
import 'package:resto_sub2/data/model/restaurant.dart';
import 'package:resto_sub2/provider/detail_provider.dart';
import 'package:resto_sub2/ui/detail_resto.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/resto_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<DetailProvider>(
        create: (_) => DetailProvider(
            apiServiceDetail: ApiServiceDetail(idDetail: restaurant.id)),
        child: DetailPage(),
      ),
    );
  }
}
