import 'package:flutter/material.dart';
import 'package:u_food_delivery_app/data/data.dart';
import 'package:u_food_delivery_app/screens/cart_Screen.dart';
import 'package:u_food_delivery_app/screens/restaurant_screen.dart';
import 'package:u_food_delivery_app/widgets/rating_star.dart';
import 'package:u_food_delivery_app/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach(
      (element) {
        restaurantList.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantScreen(
                    restaurant: element,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(
                      tag: element.imageUrl!,
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage("${element.imageUrl}"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${element.name}",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        RatingStar(rating: element.rating),
                        Text(
                          "${element.address}",
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "0.1 mile away",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle),
          iconSize: 30.0,
        ),
        title: const Text('KyaukPadaung Foodies'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()),),
            child: Text(
              'Cart (${currentUser.cart!.length})',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          const RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _buildRestaurants(),
            ],
          )
        ],
      ),
    );
  }
}
