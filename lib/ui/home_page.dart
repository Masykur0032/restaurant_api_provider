import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_sub2/data/api/api_service.dart';
import 'package:resto_sub2/provider/list_provider.dart';
import 'package:resto_sub2/ui/resto_list_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ListProvider>(
        create: (_) => ListProvider(apiService: ApiService()),
        child: RestaurantListPage(),
      ),
    );
  }
}
