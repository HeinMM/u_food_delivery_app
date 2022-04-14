import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:u_food_delivery_app/data/data.dart';
import 'package:u_food_delivery_app/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 170,
      //color: Colors.red,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(order.food!.imageUrl!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${order.food!.name!}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.restaurant!.name!,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.8, color: Colors.black54)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                order.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.all(5),
            child: Text(
              "${(order.quantity!) * (order.food!.price!)} MK",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart!.forEach(
      (Order order) => totalPrice += (order.quantity!) * (order.food!.price!),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart (${currentUser.cart!.length})"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          if (index < currentUser.cart!.length) {
            Order order = currentUser.cart![index];
            return _buildCartItem(order);
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Delivery Time:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25 min',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Cost:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
          );
        },
        itemCount: currentUser.cart!.length+1,
      ),
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -1),
            blurRadius: 6.0,
          )
        ]),
        child: Center(
          child: TextButton(
              onPressed: () {},
              child: Text(
                'CHECKOUT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              )),
        ),
      ),
    );
  }
}
