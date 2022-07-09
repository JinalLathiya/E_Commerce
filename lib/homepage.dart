import 'package:flutter/material.dart';

import 'list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.085,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Explore Product",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.635,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Apple Product",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const Spacer(),
                Container(
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('electronics');
                  },
                  child: Text(
                    "Electronics",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Fashion",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Home Accessories",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: home
                  .map(
                    (e) => Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("detail_page", arguments: e);
                          },
                          child: Container(
                            width: 250,
                            height: MediaQuery.of(context).size.height * 0.55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
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
                                    SizedBox(
                                      width: 100,
                                    ),
                                    InkWell(
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
                                            color: Colors.blue,
                                          ),
                                          child: (e.cart)
                                              ? Icon(
                                                  Icons.shopping_bag,
                                                  color: Colors.white,
                                                )
                                              : Icon(
                                                  Icons.shopping_bag_outlined,
                                                  color: Colors.white,
                                                )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("${e.image}"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "₹ ${e.price}",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width: 200,
                                  child: Text(
                                    "${e.name}",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue,
                                      // letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 200,
                                  alignment: Alignment.centerLeft,
                                  child: Text("${e.rate}"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 200,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "See the Details >>",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          const Spacer(),
        ],
      ),
      backgroundColor: const Color(0xFF3d64e7),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("wish_list");
                },
                child: const Icon(
                  Icons.favorite_outline,
                  color: Colors.blue,
                  size: 35,
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.settings_input_composite_sharp,
                  color: Colors.blue,
                  size: 35,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.only(),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: const EdgeInsets.only(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("add_to_cart");
                },
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: const Color(0xFF3055eb),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
