import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip_go/Ossama/constants.dart';
import 'package:slip_go/Ossama/strap_color.dart';
import 'package:slip_go/Product/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final  email;
  final Function([Color color, int size, bool isMale]) onChange;


  const ProductItem({@required this.product, this.email, this.onChange});

  @override
  _ShoppingHomeState createState() => _ShoppingHomeState();
}
class _ShoppingHomeState extends State<ProductItem> {

  addToCart() async {
    final ipv4 = await Ipify.ipv4();
    print(ipv4);

    DocumentSnapshot snapShot = await FirebaseFirestore.instance.collection('Users').doc(ipv4).collection('Cart').doc(widget.product.productId).get();
    if (snapShot == null || !snapShot.exists) {
      FirebaseFirestore.instance.collection('Users').doc(ipv4).collection('Cart').doc(widget.product.productId).set({
        'image': widget.product.imageUrl,
        'name': widget.product.name,
        'price': widget.product.price,
        'quantity': 1
      });
    }
    else{
      int total=snapShot.data()['quantity']+1;
      FirebaseFirestore.instance.collection('Users').doc(ipv4).collection('Cart').doc(widget.product.productId).set({
        'image': widget.product.imageUrl,
        'name': widget.product.name,
        'price': widget.product.price,
        'quantity': total
      });
    }
  }


  //TODO: this method should be moved where getting data and crating objects & change the price type to [String]
  String price(int price) {
    if (price.toInt() == price) return price.toStringAsFixed(0);
    return price.toStringAsFixed(1);
  }


  bool _isMale;
  int _size;
  Color _color;

  @override
  void initState() {
    _isMale = true;
    _size = size[0];
    _color = KColorsList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap:  () {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            elevation: 16,
            child: Container(
              height: 400.0,
              width: 360.0,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      widget.product.name,
                      style: TextStyle(fontSize: 24, color: Color(0xff515C6F), fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height:2),
                  Center(child: Text(
                    price(widget.product.price) + ' LE',
                    style: GoogleFonts.montserrat(fontSize:14,color: Color(0xff515C6F),fontWeight: FontWeight.w700),
                  ),),

                  SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/50,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/5,
                        width: MediaQuery.of(context).size.width/4,
                        child:   Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Image.network(
                            widget.product.imageUrl, //product.imageUrl,
                            fit: BoxFit.fill,
                          ),)
                        ,
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height/50),

                      RaisedButton(
                        color:  Color(0xffFFD134),
                        onPressed: () async{
                          final ipv4 = await Ipify.ipv4();
                          print(ipv4);
                        },
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        //clipBehavior: Clip.hardEdge,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(CupertinoIcons.cart,color: Color(0xff515C6F),),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/50),


                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color(0xffFFD134)
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),

                color: Color(0xffFFD134)
            ),

            child: Container(
              width: MediaQuery.of(context).size.width/7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/7,
                    child:   Padding(
                      padding: const EdgeInsets.only(bottom:1,top: 0.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.product.imageUrl,
                          fit: BoxFit.fill,
                          height: (MediaQuery.of(context).size.height/5)-(1.5),
                          width: MediaQuery.of(context).size.width/7,
                        ),
                      ),)
                    ,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/200),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/40,
                    width: 70,
                    child:Center(child:  Text(
                      widget.product.name,
                      style: GoogleFonts.montserrat(fontSize:10,color: Color(0xff515C6F)),
                    ),),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/200),
                  Text(
                    price(widget.product.price) + ' LE',
                    style: GoogleFonts.montserrat(fontSize:12,color: Color(0xff515C6F),fontWeight: FontWeight.w700),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: GestureDetector(
                        onTap: () async{
                          addToCart();
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Added to cart"),
                          ));
                        },
                        //clipBehavior: Clip.hardEdge,
                        child: Icon(CupertinoIcons.cart,color: Color(0xff515C6F),),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
