import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Product/products_view.dart';

class Slippers extends StatefulWidget {
  final userEmail;

  const Slippers({Key key, this.userEmail}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Slippers> {
  ScrollController _scrollconto = ScrollController();


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double padd = MediaQuery
        .of(context)
        .size
        .width / 12;
    return Scaffold(
      backgroundColor: Color(0xffFFD134),
      body:Container(
        child: ProductsView(
          title: '',
          orderBy: 'offer',
          email: widget.userEmail,
          //products: Provider.of<Products>(context).products
        ),
      ),
    );
  }
}
