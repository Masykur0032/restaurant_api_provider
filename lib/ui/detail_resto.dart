import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_sub2/provider/detail_provider.dart';
import 'package:resto_sub2/widgets/platform_widget.dart';

class DetailPage extends StatelessWidget {
  Widget _buildList() {
    return Consumer<DetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          var restaurantDetail = state.result.restaurant;
          return SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: restaurantDetail.pictureId,
                  child: Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/' +
                          restaurantDetail.pictureId),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Text(
                              restaurantDetail.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "img/location.png",
                                    width: 10,
                                  ),
                                  Text(
                                    restaurantDetail.city,
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "img/rating.png",
                                    width: 10,
                                  ),
                                  Text(
                                    restaurantDetail.rating.toString(),
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(color: Colors.green),
                      Text(
                        restaurantDetail.description,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.justify,
                      ),
                      Divider(color: Colors.green),
                      Text(
                        'Food list',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: restaurantDetail.menus.foods.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Image.asset(
                                  "img/foods.png",
                                  width: 8,
                                ),
                                Text(
                                  ' ' +
                                      restaurantDetail.menus.foods[index].name,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            );
                          }),
                      Divider(color: Colors.green),
                      Text(
                        'Drink list',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: restaurantDetail.menus.drinks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Image.asset(
                                  "img/drinks.png",
                                  width: 8,
                                ),
                                Text(
                                  ' ' +
                                      restaurantDetail.menus.drinks[index].name,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            );
                          }),
                      Divider(color: Colors.green),
                      Text(
                        'Customer Review',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: restaurantDetail.customerReviews.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ' +
                                      restaurantDetail
                                          .customerReviews[index].name,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                  'Date: ' +
                                      restaurantDetail
                                          .customerReviews[index].date,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                  'Review: ' +
                                      restaurantDetail
                                          .customerReviews[index].review,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                const Divider(
                                    thickness: 0.1,
                                    indent: 20,
                                    endIndent: 50,
                                    color: Colors.green),
                              ],
                            );
                          }),
                    ],
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
