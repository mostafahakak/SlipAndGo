import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:slip_go/Ossama/accessories.dart';
import '../cart.dart';
import 'strap_color.dart';
import 'constants.dart';
import 'sole_design.dart';
import 'package:cooky/cooky.dart' as cookie;

class CustomizeScreen extends StatelessWidget {

  final viewKey = GlobalKey<ViewState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/icon2.png"),)),

        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/12,
                    color: Color(0xffFFD134),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/12,
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

                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Customize',
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 42),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,),
                                child: EditControls(
                                  viewKey: this.viewKey,
                                ))),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: View(
                              key: viewKey,
                              baseLayer: images[0],
                              bColor: BaseLayerColor[0],
                              strapColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

class EditControls extends StatefulWidget {
  final GlobalKey<ViewState> viewKey;

  const EditControls({Key key, this.viewKey}) : super(key: key);

  @override
  _EditControlsState createState() => _EditControlsState();
}

class _EditControlsState extends State<EditControls> {
  int index;
  List<Widget> widgets;
  String _image;
  Color _strapColor;
  Color _bColor;
  String _accessories;

  int _size;
  bool _isMale;
  final ipv4 =  Ipify.ipv4();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(value,
          textAlign: TextAlign.center, style: TextStyle(fontSize: 14.0, fontWeight:
          FontWeight.bold),), duration: Duration(seconds: 3), backgroundColor: Colors.blue,)
    );
  }
  addToCart() async {
    final ipv4 = await Ipify.ipv4();

    print(ipv4);

    if(_strapColor.toString() == "null" || _isMale.toString() == "null" || _size == null)
      {
        showInSnackBar("Please choose Strap color & size ");
      }
    else if(_accessories == null)
    {
      if (_bColor == null)
      {
        setState(() {
          _bColor = Colors.transparent;
        });
      }
      print(_bColor.toString().substring(8,14));
      print(_strapColor.toString().substring(8,14));

      FirebaseFirestore.instance.collection('Users').doc(ipv4).collection('Cart').doc().set({

        'strapColor': "#"+_strapColor.toString().substring(10,16),
        'accessories': "",
        'male': _isMale.toString(),
        'size': _size,
        'flipImage': _image,
        'type': "acc",
        'flipImageColor': "#"+_bColor.toString().substring(10,16),
        'price': 350,
        'quantity': 1
      });

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Cart(userEmail: ipv4,)));
    }
      else
        {
          if (_bColor == null)
          {
            setState(() {
              _bColor = Colors.transparent;
            });
          }
          print(_bColor.toString().substring(8,14));
          print(_strapColor.toString().substring(8,14));

          FirebaseFirestore.instance.collection('Users').doc(ipv4).collection('Cart').doc().set({

            'strapColor': "#"+_strapColor.toString().substring(10,16),
            'accessories': _accessories,
            'male': _isMale.toString(),
            'size': _size,
            'flipImage': _image,
            'type': "acc",
            'flipImageColor': "#"+_bColor.toString().substring(10,16),
            'price': 400,
            'quantity': 1
          });

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Cart(userEmail: ipv4,)));
        }

  }

  void onFinish(){
    //TODO: implement firebase code to upload
    addToCart();
  }

  getStrapUpdate([Color color, int size, bool isMale,String acces]) {
    if (_strapColor != color) widget.viewKey.currentState.updateView(_image, color,_accessories,_bColor);
    _accessories = acces;
    _strapColor = color;
    _size = size;
    _isMale = isMale;
  }


  getAccessUpdate([Color color, int size, bool isMale,String acces]) {
    if (_accessories != acces) widget.viewKey.currentState.updateAcc(_accessories);
    _accessories = acces;
    _strapColor = color;
    _size = size;
    _isMale = isMale;

  }



  getDesignUpdate([String image,String acces]) {

        _image = image;
        _accessories = acces;
        widget.viewKey.currentState.updateView(_image, Colors.transparent,_accessories,_bColor);

  }
  getColorUpdate(Color image) {
    _bColor = image;
    widget.viewKey.currentState.updateView(_image, Colors.transparent,_accessories,_bColor);
  }
  getAccUpdate(String acc) {
    _accessories = acc;
    widget.viewKey.currentState.updateAcc(_accessories);
  }
  @override
  void initState() {
    index = 0;
    _image = images[0];
    _strapColor = null;
    _accessories = null;
    widgets = [
      SoleDesign(
        key: UniqueKey(),
        onNext: () {
          setState(() => index = 1);
          widget.viewKey.currentState.updateView(_image, KColorsList[0],_accessories,_bColor);
        },
        onChange: getDesignUpdate,
        onColor: getColorUpdate,
        onAc: getAccUpdate,
      ),
      StrapColor(
        key: UniqueKey(),
        onChange: getStrapUpdate,
        onAccChange:getAccessUpdate,
        onFinish: this.onFinish,
        onPrevious: () => setState(() {
          index = 0;
          _strapColor = null;
          _accessories = null;
          widget.viewKey.currentState.updateView(_image, Colors.transparent,_accessories,_bColor);
        }),
      ),

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(maxHeight: MediaQuery.of(context).size.height * 0.9, child: widgets[index]);
  }
}

class View extends StatefulWidget {
  final String baseLayer;
  final Color bColor;
  final Color strapColor;
  final String accessories;
  const View({Key key, @required this.baseLayer, this.strapColor, this.accessories, this.bColor}) : super(key: key);

  @override
  ViewState createState() => ViewState();
}

class ViewState extends State<View> {
  String _baseLayer;
  Color _strapColor;
  Color _bColor;
  String _accessories;

  @override
  void initState() {
    _strapColor = widget.strapColor;
    _baseLayer = widget.baseLayer;
    _accessories = widget.accessories;
    _bColor = widget.bColor;
    super.initState();
  }

  updateView(String image, Color strapColor,String accessories,Color bColor) {
    setState(() {
      _baseLayer = image;
      _strapColor = strapColor;
      _accessories = accessories;
      _bColor = bColor;
    });
  }
  updateAcc(String accessories) {
    setState(() {
      _accessories = accessories;
    });
  }
  @override
  Widget build(BuildContext context) {
    print(widget.accessories);
    print(_strapColor.toString()+"sosos");
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromRGBO(230, 230, 230, 1),
              border: Border.all(color: Color.fromRGBO(62, 62, 62, 1), width: 0.5)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(_baseLayer + '.png',color: _bColor,),
                if (_strapColor != null)
                  Image.asset("assets/images/flip1" + '_2.png', color: _strapColor),
                    _strapColor.toString() == "Color(0x80700301)"
                    ?Image.asset("assets/images/r.png")
                                          :Container(),
                    _strapColor.toString() == "Color(0xfff15921)"
                        ?Image.asset("assets/images/o.png")
                        :Container(),
                    _strapColor.toString() == "Color(0x99bb7e27)"
                    ?Image.asset("assets/images/y.png")
                    :Container(),
                _strapColor.toString() == "Color(0xffffeb3b)"
                    ?Image.asset("assets/images/ny.png")
                    :Container(),
                _strapColor.toString() == "Color(0x99bb7e27)"
                    ?Image.asset("assets/images/nv.png")
                    :Container(),
                _strapColor.toString() == "Color(0xffe91e63)"
                    ?Image.asset("assets/images/np.png")
                    :Container(),
                _strapColor.toString() == "Color(0xffff5722)"
                    ?Image.asset("assets/images/no.png")
                    :Container(),
                _strapColor.toString() == "Color(0xff9e9e9e)"
                    ?Image.asset("assets/images/msilver.png")
                    :Container(),
                _strapColor.toString() == "Color(0xff848484)"
                    ?Image.asset("assets/images/mgrey.png")
                    :Container(),
                _strapColor.toString() == "Color(0xb3ffffff)"
                    ?Image.asset("assets/images/mofwhite.png")
                    :Container(),
                _strapColor.toString() == "Color(0xffff4081)"
                    ?Image.asset("assets/images/mpink.png")
                    :Container(),
                _strapColor.toString() == "Color(0xff4caf50)"
                    ?Image.asset("assets/images/mgreen.png")
                    :Container(),
                _strapColor.toString() == "Color(0xff448aff)"
                    ?Image.asset("assets/images/mblue.png")
                    :Container(),
                _strapColor.toString() == "Color(0x85bd770d)"
                    ?Image.asset("assets/images/mgold.png")
                    :Container(),
                _strapColor.toString() == "Color(0xffbd770d)"
                    ?Image.asset("assets/images/mdeepgold.png")
                    :Container(),
                _strapColor.toString() == "Color(0x00000000)" ?Container()
                :Image.asset("assets/acc/logoslip.png"),
                if (_accessories != null) Image.asset("assets/acc/"+_accessories+".png")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
