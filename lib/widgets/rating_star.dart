import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar( {Key? key, this.rating}) : super(key: key);

  final int? rating;

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (var i = 0; i < rating!; i++) {
      stars += '⭐  ';
    }
    stars.trim();
    return Text(
      stars,
      style: TextStyle(fontSize: 18.0),
    );
  }
}
