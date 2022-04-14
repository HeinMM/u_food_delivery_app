import 'package:flutter/material.dart';
import 'package:u_food_delivery_app/data/data.dart';
import 'package:u_food_delivery_app/models/order.dart';
import 'package:u_food_delivery_app/widgets/rating_star.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  _buildRecendOrders(BuildContext context, Order order) {
    return Container(
      width: 320,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1.0, color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                height: 110.0,
                width: 105,
                image: AssetImage("${order.food!.imageUrl}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${order.food!.name}",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  
                  Text(
                    "${order.restaurant!.name}",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${order.date}",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1,color: Colors.grey.shade300),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recend Orders",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 120,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.orders![index];
                return _buildRecendOrders(context, order);
              }),
        )
      ],
    );
  }
}
