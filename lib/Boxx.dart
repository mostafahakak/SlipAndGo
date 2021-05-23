import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Ossama/constants.dart';
import 'Ossama/strap_color.dart';
import 'Product/products_view.dart';

class Boxx extends StatefulWidget {
  final userEmail;
  final Function([Color color, int size, bool isMale,String access]) onChange;
  const Boxx({Key key, this.userEmail, this.onChange}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Boxx> {

  bool _isMale;
  int _size;
  Color _color;
  String _access;

  @override
  void initState() {
    _isMale = true;
    _size = size[0];
    _color = KColorsList[0];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        child:ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50, mainAxisSpacing: 20, crossAxisSpacing: 20),
              itemCount: AdultColorsList.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => ColorBox(
                key: UniqueKey(),
                color: AdultColorsList[index],
                onSelected: (Color color) => setState(() {
                  _color = color;
                  widget.onChange(_color, _size, _isMale,_access);
                }),
                selected: _color == AdultColorsList[index],
              )),
        ),
      ),
    );
  }
}
