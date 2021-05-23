import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_myfatoorah/flutter_myfatoorah.dart';

import 'Ossama/customize_screen.dart';
import 'Product/products_view.dart';
import 'main.dart';

class Choose extends StatefulWidget {
  final userEmail;

  const Choose({Key key, this.userEmail}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Choose> {
  ScrollController _scrollconto = ScrollController();


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
  String result = 'Tap Pay';

  Future<void> startpayment() async {
    //test credentials
    String credUrl = "https://apidemo.myfatoorah.com/";
    String credEmail = "apiaccount@myfatoorah.com";
    String credPass = "api12345*";
    int language = 0;
    String name = "anil meena";
    double price = 555.0;
    String paymentMethod = ".all";
    String data;
    Map<dynamic, dynamic> map = {"cred_url":credUrl,
      "cred_email":credEmail,
      "cred_pass":credPass,
      "language":language,
      "name":name,
      "price":price,
      "payment_method":paymentMethod};
    try {
      data = await FlutterMyfatoorah.payment(map);
    } on PlatformException {
      data = 'Failed';
    }
    setState(() {
      result = data;
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width.toString);

    double padd = MediaQuery
        .of(context)
        .size
        .width / 12;

    return Scaffold(
      backgroundColor: Color(0xffFFD134),
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/banew.jpg"),
                fit: BoxFit.fill)),

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.width/4.5,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/3.3,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CustomizeScreen()));
                    },
                    child:  Container(
                      height: MediaQuery.of(context).size.width/10,
                      width:  MediaQuery.of(context).size.width/10,
                      margin: EdgeInsets.all(8),
                      child: Image.asset("assets/cust.png",
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/14,
                  ),
                  GestureDetector(
                    onTap: (){
                      // startpayment();

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width/10,
                      width: MediaQuery.of(context).size.width/10,
                      margin: EdgeInsets.all(8),
                      child: Image.asset("assets/myshop.png",
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/40,
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
