import 'package:flutter/material.dart';

import 'list.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 250,
                            width: 350,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("${args.image}"),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  args.id = 1;
                                  Navigator.of(context).pushNamed("/");
                                });
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 453,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${args.name}",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              args.like = !args.like;
                              if (args.like == true) {
                                fav.add(args);
                              } else {
                                fav.remove(args);
                              }
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueAccent.withOpacity(0.2),
                            ),
                            child: (args.like)
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.blueAccent,
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.blueAccent,
                                  ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 60),
                      child: Text(
                        "₹ ${args.id * args.price}",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "${args.info}",
                        style: TextStyle(
                          fontSize: 20,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 160),
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (args.id > 1) {
                                    args.id--;
                                  }
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${args.id}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (args.id >= 1) {
                                    args.id++;
                                  }
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                ),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          args.cart = !args.cart;
                          if (args.cart == true) {
                            Cart.add(args);
                          } else {
                            Cart.remove(args);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Added To Cart"),
                          ));
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue,
                        ),
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
