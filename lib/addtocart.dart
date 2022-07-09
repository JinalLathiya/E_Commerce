import 'package:flutter/material.dart';

import 'list.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/", (route) => false);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 30,
          ),
        ),
        title: Text(
          "Add to Cart",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: (Cart.isEmpty == true) ?SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sorry .. !!",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your Cart is Empty..!!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ) :SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: Cart
                  .map(
                    (e) => Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 180,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 170,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("${e.image}"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 130,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          e.cart = !e.cart;
                                          if (e.cart == true) {
                                            Cart.add(e);
                                          } else {
                                            Cart.remove(e);
                                          }
                                        });
                                      },
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blueAccent
                                                .withOpacity(0.2),
                                          ),
                                          child: (e.cart)
                                              ? Icon(
                                            Icons.shopping_bag,
                                            color: Colors.blueAccent,
                                          )
                                              : Icon(
                                            Icons
                                                .shopping_bag_outlined,
                                            color: Colors.blueAccent,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Text("${e.name}",style: TextStyle(fontSize: 25),),
                              SizedBox(height: 20,),
                              Text("₹ ${e.price}",style: TextStyle(fontSize: 25),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
