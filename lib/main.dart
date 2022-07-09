import 'package:flutter/material.dart';

import 'addtocart.dart';
import 'details_page.dart';
import 'electronics.dart';
import 'homepage.dart';
import 'wishlist.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Homepage(),
        "detail_page": (context) => const DetailsPage(),
        "wish_list": (context) => const Wishlist(),
        "add_to_cart": (context) => const AddToCart(),
        "electronics": (context) => const Electronics_page(),
      },
    ),
  );
}
