import 'dart:math';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip_go/cart.dart';
import 'package:slip_go/choose.dart';
import 'package:slip_go/slippers.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'Ossama/customize_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userEmail;

  const MyApp({Key key, this.userEmail}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slip & Go',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Choose(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  var _pages = [Slippers(userEmail: "",), Slippers(userEmail: ""), Slippers(userEmail:"")];
  int _seletedItem = 0;
  var _pageController = PageController();
  double firstpress = 20;
  double secpress = 15;
  double thirdpress = 15;
  int selected = 0;

  final items = <String>[
    '100EGP',
    'Power bank',
    'USB',
    '50 EGP',
    'Yoda',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
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
                        onTap: (){
                          showDialog(context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                elevation: 16,
                                child: Container(
                                  height: 400.0,
                                  width: 360.0,
                                  child: ListView(
                                    children: <Widget>[
                                      SizedBox(
                                        width:200,
                                        height: 200,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selected = Random().nextInt(items.length);
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: FortuneWheel(
                                                  selected: selected,
                                                  items: [
                                                    for (var it in items) FortuneItem(child: Text(it)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                              );
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
                      Text("Shop",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w700),),
                      SizedBox(
                        height: MediaQuery.of(context).size.width/80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                firstpress = 25;
                                secpress = 15;
                                thirdpress = 15;
                                _seletedItem = 0;
                                _pageController.animateToPage(_seletedItem,
                                    duration: Duration(milliseconds: 200), curve: Curves.linear);
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/sl.jpeg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)
                                    ),
                                  ),
                                  height: MediaQuery.of(context).size.width/7,
                                  width: MediaQuery.of(context).size.width/5,
                                ),
                                Center(
                                  child: Text(
                                    "Slippers",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: firstpress),
                                  ),
                                )

                              ],
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/10),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                firstpress = 15;
                                secpress = 25;
                                thirdpress = 15;

                                _seletedItem = 1;
                                _pageController.animateToPage(_seletedItem,
                                    duration: Duration(milliseconds: 200), curve: Curves.linear);
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/sh.jpeg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)
                                    ),
                                  ),
                                  height: MediaQuery.of(context).size.width/7,
                                  width: MediaQuery.of(context).size.width/5,
                                ),
                                Center(
                                  child: Text(
                                    "Shoes",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: secpress),
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(width: MediaQuery.of(context).size.width/10),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                firstpress = 15;
                                secpress = 15;
                                thirdpress = 25;
                                _seletedItem = 2;
                                _pageController.animateToPage(_seletedItem,
                                    duration: Duration(milliseconds: 200), curve: Curves.linear);
                              });
                            },
                            child:Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.width/7,
                                  width: MediaQuery.of(context).size.width/5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/ot.jpeg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Other",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: thirdpress),
                                  ),
                                )

                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width/80,
                      ),


                      Expanded(
                        child: PageView(
                          children: _pages,
                          onPageChanged: (index) {
                            setState(() {
                            });
                          },
                          controller: _pageController,
                        ),
                      )



                    ],
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
