import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip_go/Alert.dart';
import 'package:slip_go/Cart/CartProduct.dart';
import 'package:string_to_hex/string_to_hex.dart';
import 'Ossama/customize_screen.dart';
import 'main.dart';

class Cart extends StatefulWidget {
  final userEmail;

  const Cart({Key key, this.userEmail}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Cart> {
  ScrollController _scrollconto = ScrollController();
  var nameconto = TextEditingController();
  var addconto = TextEditingController();
  var mobileconto = TextEditingController();
  var floorconto = TextEditingController();
  var promoconto = TextEditingController();
  var defcolor = Colors.black;
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
  var redColor = Color.fromRGBO(243, 81, 46, 0.8);

  @override
  Widget build(BuildContext context) {
    double padd = MediaQuery
        .of(context)
        .size
        .width / 12;


    return Scaffold(
      body: Center(
        child: ListView(
          children: [

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users').doc(widget.userEmail.toString()).collection('Cart')
                  .snapshots(),
              builder: (context, snapshots) {
                if (snapshots.hasData&&snapshots.data.size>0)
                {
                  int price = 0;
                  List<ProductContainer> allProductsInCart = [];
                  for (var product in snapshots.data.docs) {
                    price = price + (product.data()['price']*product.data()['quantity']);
                    allProductsInCart.add(ProductContainer(
                      pId:product.id,
                      type:product.data()['type'],
                      userId: widget.userEmail.toString(),
                      accessories: product.data()['accessories'],
                      flipImage: product.data()['flipImage'],
                      flipImageColor: product.data()['flipImageColor'],
                      male: product.data()['male'],
                      quantity: product.data()['quantity'],
                      price: product.data()['price'].toDouble(),
                      size: product.data()['size'],
                      strapColor: product.data()['strapColor'],
                    ));
                  }
                  print(price);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/10,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width/10,
                            ),
                            GestureDetector(
                              onTap: ()
                              {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CustomizeScreen()));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/12,
                                width: MediaQuery.of(context).size.width/20,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/slipicon.png",
                                    fit: BoxFit.fitHeight),
                              ) ,
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width/3,
                            ),
                            GestureDetector(
                              onTap: ()
                              {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/12,
                                width: MediaQuery.of(context).size.width/15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/logo.png",
                                    fit: BoxFit.fitWidth),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/3,
                            ),

                            GestureDetector(
                              onTap: ()async{
                                final ipv4 = await Ipify.ipv4();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Cart(userEmail: ipv4,)));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/12,
                                width: MediaQuery.of(context).size.width/20,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/carticon.png",
                                    fit: BoxFit.fitHeight),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Color(0xffFFD134),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width/90,
                            ),
                            Text("My Cart",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w700),),
                            SizedBox(
                              height: MediaQuery.of(context).size.width/40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  height: MediaQuery.of(context).size.height/1.5,
                                  width: MediaQuery.of(context).size.width/3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Column(
                                    children: [

                                      SizedBox(height: MediaQuery.of(context).size.height/40 ,),
                                      Text("Items",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.width/40,fontWeight: FontWeight.w700),),
                                      SizedBox(height: MediaQuery.of(context).size.height/40 ,),
                                      StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('Users').doc(widget.userEmail).collection('Cart')
                                            .snapshots(),
                                        builder: (context, snapshots) {
                                          if (snapshots.hasData&&snapshots.data.size>0) {

                                            return Container(
                                              height: MediaQuery.of(context).size.height/2,
                                              width: MediaQuery.of(context).size.width/3.2,
                                                child: ListView(
                                                  scrollDirection: Axis.vertical,
                                                  physics: AlwaysScrollableScrollPhysics() ,
                                                  children: allProductsInCart,
                                                ),

                                            );
                                          }else if(snapshots.data.size==0){
                                            return Center(
                                              child: Text('No Products In Cart Add some',style: TextStyle(color: Colors.deepOrange,fontFamily: 'modak',fontSize: 20),),
                                            );
                                          } else {
                                            return Center(child: Text('No Products In Cart Add some',style: TextStyle(color: Colors.deepOrange,fontFamily: 'modak',fontSize: 20),));
                                          }
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width/40,

                                ),

                                Container(color: Color(0xff707070),
                                  height: MediaQuery.of(context).size.height/1.8,
                                  width: 5,),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width/40,

                                ),

                                Container(
                                  height: MediaQuery.of(context).size.height/1.5,
                                  width: MediaQuery.of(context).size.width/3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height/40 ,),
                                      Text("Checkout",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.width/40,fontWeight: FontWeight.w700),),
                                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width:  MediaQuery.of(context).size.width/60,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width/7,
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.5),
                                                        child: Text("Name",style: GoogleFonts.lato(fontSize:10),),
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.only(top: 0.01,bottom: 0.5 ),
                                                      child:
                                                      SizedBox(height: MediaQuery.of(context).size.height/20,
                                                        child: TextFormField(
                                                          onChanged: (value)
                                                          {
                                                          },
                                                          controller: nameconto,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: MediaQuery.of(context).size.width/60,
                                                            color:  Colors.black,
                                                          ),
                                                          cursorColor:Colors.black,
                                                          keyboardType: TextInputType.emailAddress,
                                                          decoration: new InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                                            ),
                                                            labelStyle: TextStyle(
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ),),),
                                                    SizedBox(height: MediaQuery.of(context).size.height/40 ,),

                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.5),
                                                        child: Text("Address",style: GoogleFonts.lato(fontSize:10),),
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.only(top: 0.01,bottom: 0.5 ),
                                                      child:
                                                      SizedBox(height: MediaQuery.of(context).size.height/20,
                                                        child: TextFormField(
                                                          onChanged: (value)
                                                          {
                                                          },
                                                          controller: addconto,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: MediaQuery.of(context).size.width/60,
                                                            color:  Colors.black,
                                                          ),
                                                          cursorColor:Colors.black,
                                                          keyboardType: TextInputType.name,
                                                          decoration: new InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                                            ),
                                                            labelStyle: TextStyle(
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ),),),
                                                    SizedBox(height: MediaQuery.of(context).size.height/40 ,),

                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.5),
                                                        child: Text("Floor/APT",style: GoogleFonts.lato(fontSize:10),),
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.only(top: 0.01,bottom: 0.5 ),
                                                      child:
                                                      SizedBox(height: MediaQuery.of(context).size.height/20,
                                                        child: TextFormField(
                                                          onChanged: (value)
                                                          {
                                                          },
                                                          controller: floorconto,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color:  Colors.black,
                                                          ),
                                                          cursorColor:Colors.black,
                                                          keyboardType: TextInputType.numberWithOptions(),
                                                          decoration: new InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                                            ),
                                                            labelStyle: TextStyle(
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ),),),
                                                    SizedBox(height: MediaQuery.of(context).size.height/40 ,),

                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.5),
                                                        child: Text("Mobile number",style: GoogleFonts.lato(fontSize:10),),
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.only(top: 0.01,bottom: 0.5 ),
                                                      child:
                                                      SizedBox(height: MediaQuery.of(context).size.height/20,
                                                        child: TextFormField(
                                                          onChanged: (value)
                                                          {
                                                          },
                                                          controller: mobileconto,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color:  Colors.black,
                                                          ),
                                                          cursorColor:Colors.black,
                                                          keyboardType: TextInputType.number,
                                                          decoration: new InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                                            ),
                                                            labelStyle: TextStyle(
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ),),),



                                                  ],
                                                ),
                                              ),

                                              SizedBox(width:  MediaQuery.of(context).size.width/60,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width/7,
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.5),
                                                        child: Text("Choose your payment",style: GoogleFonts.lato(fontSize:10,color: Colors.grey),),
                                                      ),
                                                    ),

                                                    SizedBox(height: MediaQuery.of(context).size.height/30 ,),
                                                    SizedBox(height: MediaQuery.of(context).size.height/20,
                                                      child: GestureDetector(
                                                        onTap:(){
                                                          setState(() {
                                                            defcolor = Colors.red;
                                                          });
                                                        },
                                                        child:Text("Cash on Delivery",style:TextStyle(color:defcolor,)),
                                                      ),),
                                                    SizedBox(height: MediaQuery.of(context).size.height/40 ,),

                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Image.asset(
                                                        'assets/visaicon.png',
                                                        width:  MediaQuery.of(context).size.width/8,
                                                        height: MediaQuery.of(context).size.height/20,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height/40 ,),

                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.5),
                                                        child: Text("",style: GoogleFonts.lato(fontSize:10),),
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.only(top: 0.01,bottom: 0.5 ),
                                                      child:
                                                      SizedBox(height: MediaQuery.of(context).size.height/20,
                                                      ),
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height/40 ,),

                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.5),
                                                        child: Text("PromoCode",style: GoogleFonts.lato(fontSize:10),),
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.only(top: 0.01,bottom: 0.5 ),
                                                      child:
                                                      SizedBox(height: MediaQuery.of(context).size.height/20,
                                                        child: TextFormField(
                                                          onChanged: (value)
                                                          {
                                                          },
                                                          controller: promoconto,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color:  Colors.black,
                                                          ),
                                                          cursorColor:Colors.black,
                                                          keyboardType: TextInputType.emailAddress,
                                                          decoration: new InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                                            ),
                                                            labelStyle: TextStyle(
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ),),),
                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width/7,
                                                child: Column(
                                                  children: [

                                                    SizedBox(height: MediaQuery.of(context).size.height/20 ,),

                                                    Column(children: [
                                                      Text(" Total ",style: TextStyle(color: Colors.grey,fontSize: 9),),
                                                      SizedBox(height: MediaQuery.of(context).size.height/80 ,),
                                                      Text("EGP :"+ price.toString(),style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w700),),

                                                    ],),


                                                  ],
                                                ),
                                              ),

                                              SizedBox(
                                                width: MediaQuery.of(context).size.width/7,
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: MediaQuery.of(context).size.height/20 ,),

                                                    GestureDetector(
                                                      onTap:()
                                                      {
                                                        /*
                                                        if (total > 0) {
                                                          var docs = await FirebaseFirestore.instance
                                                              .collection('Promocodee')
                                                              .get();
                                                          for (var promo in docs.docs) {
                                                            if (promo.data()['Promo'] == promoCode) {
                                                              discount =
                                                                  await promo.data()['Discount'].toDouble();
                                                            }
                                                          }
                                                          if (phone.text.isNotEmpty &&
                                                              address.text.isNotEmpty &&
                                                              apt.text.isNotEmpty &&
                                                              town != null) {
                                                            if (discount == 0) {
                                                              Alert().ConfirmDialog(
                                                                  context: context,
                                                                  message:
                                                                  'Sorry this Promo Code is invalid. Do you want to continue making the order ?',
                                                                  fun: () {
                                                                    _checkOut(user: userIds, promo: '');
                                                                  });
                                                            } else {
                                                              Alert().ConfirmDialog(
                                                                  context: context,
                                                                  message:
                                                                  'This Promo Code gives you $discount as a Discount, Do you want to Continue ?',
                                                                  fun: () {
                                                                    _checkOut(user: userIds, promo: promoCode);
                                                                  });
                                                            }

                                                          } else {
                                                            Scaffold.of(context).showSnackBar(SnackBar(
                                                              content: Text("Please Fill the missing fields"),
                                                            ));
                                                          }
                                                        }

                                                        */
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(25),
                                                        child: TextButton(
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width/8,
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: redColor),
                                                              padding: const EdgeInsets.all(6),
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                    Center(child: Text('Checkout', style: const TextStyle(fontSize: 12, color: Colors.white))),
                                                                  ),
                                                                  Container(
                                                                    padding: const EdgeInsets.all(4),
                                                                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                                                    child: Icon(
                                                                      Icons.arrow_forward_ios_outlined,
                                                                      color: redColor,
                                                                      size: 18,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )

                                            ],
                                          )
                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            )

                          ],
                        ),
                      )

                    ],
                  );
                }
                else if(snapshots.data == null){
                  return Center(
                    child: Text('No Products In Cart Add some',style: TextStyle(color: Colors.deepOrange,fontFamily: 'modak',fontSize: 20),),
                  );
                } else {
                  return Center(child: Text('No Products In Cart Add some',style: TextStyle(color: Colors.deepOrange,fontFamily: 'modak',fontSize: 20),));
                }
              },
            ),



          ],
        ),
      ),
    );
  }
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
class ProductContainer extends StatelessWidget {

  final String userId;
  final String pId;
  final String accessories;
  final String flipImage;
  final String flipImageColor;
  final String male;
  final String type;
  final int size;
  final String strapColor;
  final double price;
  final int quantity;
  ProductContainer(
      {this.userId, this.accessories, this.flipImage, this.flipImageColor, this.male, this.size, this.strapColor, this.price, this.quantity, this.pId, this.type});


  @override
  Widget build(BuildContext context) {


    var screenSize = MediaQuery.of(context).size;
    print(flipImage+flipImageColor+size.toString());
    // TODO: implement build
  print(HexColor(flipImageColor));
    return  type == "acc"
            ?Padding(
      padding: const EdgeInsets.only(left: 10,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width/4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(230, 230, 230, 1),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                flipImageColor.toString() == "#000000"
                    ?Image.asset(flipImage + '.png',)
                    :Image.asset(flipImage + '.png',color: HexColor(flipImageColor),),
                if (strapColor != null) Image.asset("assets/images/flip1" + '_2.png',color: HexColor(strapColor),),
                strapColor.toString() == "Color(0xff700301)" ||
                    strapColor.toString() == "Color(0xff700301)" ||
                    strapColor.toString() == "Color(0xff700301)"
                    ?Image.asset("assets/images/flip1" + '_2.png')
                    :Container(),
                strapColor.toString() == "Color(0x00000000)" ?Container()
                    :Image.asset("assets/acc/logoslip.png"),
                if (accessories != null) Image.asset("assets/acc/"+accessories+".png")
              ],
            ),
          ),
          SizedBox(height: 5,),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:2 ),
                child: Container(
                  padding: EdgeInsets.only(left:5),
                  child: Row(
                    children: [
                      Text(
                        price.toString(),
                        style: TextStyle(
                            fontFamily: 'modak',
                            fontSize: 11,
                            color: Color(0xff0D2943)),
                      ),
                      Expanded(
                        child: Text(
                          ' EGP',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0D2943),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:5 ),
                        child:  Counter(
                          quantity: quantity,
                          productId: pId,
                          price: price,
                          userId:userId,

                        ),
                      ),
                      /*  Counter(
                                quantity: quantity,
                                productId: productId,
                                userId: userId,
                                price: price,
                                image: image,
                                productName: productName,
                              ),*/
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    )
            :Padding(
      padding: const EdgeInsets.only(left: 10,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width/4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(230, 230, 230, 1),
            ),
            child: Image.network(flipImage),
          ),
          SizedBox(height: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top:2 ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/8.5),
                    child: Row(
                      children: [
                        Text(
                          price.toString(),
                          style: TextStyle(
                              fontFamily: 'modak',
                              fontSize: 11,
                              color: Color(0xff0D2943)),
                        ),
                        Expanded(
                          child: Text(
                            ' EGP',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0D2943),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              Counter(
                quantity: quantity,
                productId: pId,
                price: price,
              ),

              Padding(
                padding: EdgeInsets.only(top : 2
                ),
                child: GestureDetector(
                  onTap: ()async{
                    final ipv4 = await Ipify.ipv4();

                    FirebaseFirestore.instance.collection('Users').doc(ipv4).collection('Cart').doc(pId).delete();

                  },
                  child: Center(
                    child: Container(
                      child: Icon(Icons.delete),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final String productName;
  final String image;
  final double price;
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
    print(widget.productId);
    print(widget.price);
    // TODO: implement build
    return Row(
      children: [
        Container(
          child: Row(
            children: [
              GestureDetector(
                onTap: () async{
                  if (widget.quantity > 1) {
                    setState(() {
                      widget.quantity--;
                    });
                    FirebaseFirestore.instance
                        .collection('Users')
                        .doc(widget.userId)
                        .collection('Cart')
                        .doc(widget.productId)
                        .update({
                      'quantity': widget.quantity,
                    });
                  } else {
                    Alert().ConfirmDialog(
                        context: context,
                        message:
                        'Are you sure you want to remove this product from cart',
                        fun: () {
                          FirebaseFirestore.instance
                              .collection('Users')
                              .doc(widget.userId)
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
                      color: Colors.grey,
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
                          fontSize: 9,
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
                      .update({
                    'quantity': widget.quantity,
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