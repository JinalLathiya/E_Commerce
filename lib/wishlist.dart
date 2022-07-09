import 'package:flutter/material.dart';

import 'list.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 30,
          ),
        ),
        title: Text(
          "Wishlist",
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
      body: (fav.isEmpty == true)
          ? SafeArea(
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
                      "Your Wishlist is Empty..!!",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: fav
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
                                                    e.like = !e.like;
                                                    if (e.like == true) {
                                                      fav.add(e);
                                                    } else {
                                                      fav.remove(e);
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
                                                    child: (e.like)
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: Colors.blueAccent,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .favorite_border_outlined,
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
