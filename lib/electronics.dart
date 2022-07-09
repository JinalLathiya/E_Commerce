import 'dart:ffi';

import 'package:flutter/material.dart';

import 'list.dart';

class Electronics_page extends StatefulWidget {
  const Electronics_page({Key? key}) : super(key: key);

  @override
  _Electronics_pageState createState() => _Electronics_pageState();
}

class _Electronics_pageState extends State<Electronics_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Electronics",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w700, color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
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
      ),
      body: Container(
        alignment: Alignment.center,
        child: Wrap(
          children: electric
              .map(
                (e) => SingleChildScrollView(
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 180,
                          width: 360,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
