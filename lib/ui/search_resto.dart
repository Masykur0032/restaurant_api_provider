import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:resto_sub2/provider/search_provider.dart';
import 'package:resto_sub2/ui/resto_search_page.dart';
import 'package:resto_sub2/widgets/card_search_resto.dart';
import 'package:resto_sub2/widgets/platform_widget.dart';

class RestaurantListPageSearch extends StatelessWidget {
  Widget _buildList() {
    TextEditingController searchController = TextEditingController();
    return Consumer<SearchProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: 1,
                      ),
                    ),
                    Expanded(
                      flex: 75,
                      child: TextField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Cari Nama Restaurant...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 15,
                        child: IconButton(
                            onPressed: () => Navigator.pushNamed(
                                  context,
                                  RestaurantSearchPage.routeName,
                                  arguments: searchController.text.toString(),
                                ),
                            icon: const Icon(Icons.search))),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: 1,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.result.restaurants.length,
                      itemBuilder: (context, index) {
                        var restaurant = state.result.restaurants[index];
                        return CardSearchRestaurant(restaurant: restaurant);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resto App'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Resto App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
