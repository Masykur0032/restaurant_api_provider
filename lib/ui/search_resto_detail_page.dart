import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_sub2/data/api/api_service_search_detail.dart';
import 'package:resto_sub2/data/model/restaurant_search.dart';
import 'package:resto_sub2/provider/search_detail_provider.dart';
import 'package:resto_sub2/ui/search_detail_resto.dart';

class RestaurantDetailPageSearch extends StatelessWidget {
  static const routeName = '/search_resto_detail';

  final RestaurantSearch restaurant;

  const RestaurantDetailPageSearch({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<DetailProviderSearch>(
        create: (_) => DetailProviderSearch(
            apiServiceDetailSearch:
                ApiServiceDetailSearch(idDetail: restaurant.id)),
        child: DetailPageSearch(),
      ),
    );
  }
}
