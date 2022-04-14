import 'package:flutter/material.dart';
import 'package:u_food_delivery_app/models/food.dart';
import 'package:u_food_delivery_app/models/restaurant.dart';
import 'package:u_food_delivery_app/widgets/rating_star.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant? restaurant;
  const RestaurantScreen({Key? key, this.restaurant}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("${menuItem.imageUrl}"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3)
                  ],
                  stops: [
                    0.1,
                    0.5,
                    0.6,
                    0.9
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 65,
            child: Column(
              children: <Widget>[
                Text(
                  menuItem.name!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                Text(
                  "${menuItem.price.toString()} MMK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant!.imageUrl!,
                child: Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage("${widget.restaurant!.imageUrl}"),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                      iconSize: 30,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      iconSize: 35,
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant!.name!,
                      style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1),
                    ),
                    const Text(
                      "0.1 mile away",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                RatingStar(
                  rating: widget.restaurant!.rating,
                ),
                Text(
                  widget.restaurant!.address!,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 130,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Center(
                    child: Text(
                      "Reviews",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 130,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Center(
                    child: Text(
                      "Contact",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.restaurant!.menu!.length, (index) {
                Food food = widget.restaurant!.menu![index];
                return _buildMenuItem(food);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
