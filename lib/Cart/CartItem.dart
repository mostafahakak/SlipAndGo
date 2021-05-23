import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip_go/Cart/cartmodel.dart';
import '../Alert.dart';


class CartItem extends StatefulWidget {
  final CartModel product;
  final  email;

  const CartItem({@required this.product, this.email});

  @override
  _ShoppingHomeState createState() => _ShoppingHomeState();
}
class _ShoppingHomeState extends State<CartItem> {


  //TODO: this method should be moved where getting data and crating objects & change the price type to [String]
  String price(int price) {
    if (price.toInt() == price) return price.toStringAsFixed(0);
    return price.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap:  () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => ProductScreen(product: widget.product,email: widget.email,)));
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
          child:  Container(
            height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width/5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/6,
                      width: MediaQuery.of(context).size.width/10,
                      child:   Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            widget.product.imageUrl, //product.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),)
                      ,
                    ),

                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/40,
                ),
                Column(
                  children: [

                    SizedBox(height: 20),
                    SizedBox(
                      child:Center(child:  Text(
                        widget.product.name,
                        style: GoogleFonts.montserrat(fontSize:10,color: Color(0xff515C6F)),
                      ),),
                    ),

                    SizedBox(height: 3),
                    Text(
                      price(widget.product.price) + ' LE',
                      style: GoogleFonts.montserrat(fontSize:12,color: Color(0xff515C6F),fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 1),

                    Counter(
                      quantity: 1,
                      productId: widget.product.productId,
                      userId: "ipv4",
                      price: int.parse(widget.product.price.toString()),
                      image: widget.product.imageUrl,
                      productName: widget.product.name,
                    )

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final String productName;
  final String image;
  final int price;
  final String productId;
  final String userId;
  int quantity;
  Counter(
      {this.quantity,
        this.productId,
        this.userId,
        this.price,
        this.productName,
        this.image});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Row(
      children: [
        Container(
          child: Row(
            children: [
              GestureDetector(
                onTap: () async{
                  final ipv4 = await Ipify.ipv4();
                  print(ipv4);


                  if (widget.quantity > 1) {
                    setState(() {
                      widget.quantity--;
                    });
                    FirebaseFirestore.instance
                        .collection('Users')
                        .doc(ipv4.toString())
                        .collection('Cart')
                        .doc(widget.productId)
                        .set({
                      'image': widget.image,
                      'name': widget.productName,
                      'price': widget.price,
                      'quantity': widget.quantity
                    });
                  } else {
                    Alert().ConfirmDialog(
                        context: context,
                        message:
                        'Are you sure you want to remove this product from cart',
                        fun: () {
                          FirebaseFirestore.instance
                              .collection('Users')
                              .doc(ipv4.toString())
                              .collection('Cart')
                              .doc(widget.productId)
                              .delete();
                        });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      color: Color(0xff0D2943),
                    ),
                  ),
                ),
              ),
              Container(
                height: screenSize.height / 10 * 0.35,
                width: screenSize.height / 10 * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Color(0xff0D2943))),
                child: Center(
                    child: Text(
                      widget.quantity.toString(),
                      style: TextStyle(
                          color: Color(0xff0D2943),
                          fontSize: screenSize.width /80,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.quantity++;
                  });
                  FirebaseFirestore.instance
                      .collection('Users')
                      .doc(widget.userId)
                      .collection('Cart')
                      .doc(widget.productId)
                      .set({
                    'image': widget.image,
                    'name': widget.productName,
                    'price': widget.price,
                    'quantity': widget.quantity
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Color(0xff0D2943),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

