import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_sub2/data/api/api_service_search.dart';
import 'package:resto_sub2/provider/search_provider.dart';
import 'package:resto_sub2/ui/search_resto.dart';

class RestaurantSearchPage extends StatelessWidget {
  static const routeName = '/resto_search';

  final String nameRestaurant;

  const RestaurantSearchPage({required this.nameRestaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SearchProvider>(
        create: (_) => SearchProvider(
            apiServiceSearch: ApiServiceSearch(query: nameRestaurant)),
        child: RestaurantListPageSearch(),
      ),
    );
  }
}
