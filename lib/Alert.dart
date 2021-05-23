import 'package:flutter/material.dart';



enum ConfirmAction { CANCEL, ACCEPT }
Color mainColor=Color(0XFFFB6101);
class Alert {

  Future<ConfirmAction> ConfirmDialog({BuildContext context,String message,fun()}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialogFun(
        description:message,fun: fun,
      ),
    );
  }

}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}



class CustomDialogFun extends StatelessWidget {
  final String  description ;
  final Image image;
  Function fun;

  CustomDialogFun({
    @required this.description,
    @required this.fun,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContentFun(context,description,fun),
    );
  }
}
dialogContentFun(BuildContext context,String Des,Function fun()) {
  return Stack(
    children: <Widget>[
      //...bottom card part,
      BottomCardPartFun(description: Des,fun: fun,),

      //...top circlular image part,
      Positioned(
        left: Consts.padding,
        right: Consts.padding,
        child: CircleAvatar(
          backgroundColor: mainColor,
          radius: Consts.avatarRadius,
          child: Icon(Icons.priority_high,size: MediaQuery.of(context).size.width/10*2,color: Colors.white,),
        ),
      ),
    ],
  );
}

class BottomCardPartFun extends StatelessWidget{

  //String title;
  String description;
  Function fun;
  BottomCardPartFun({this.description,this.fun});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
        top: Consts.avatarRadius + Consts.padding,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: EdgeInsets.only(top: Consts.avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[

          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/10*0.4,fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: mainColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: Colors.white ,
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Center(child: Text('Cancel',style: TextStyle(color:mainColor,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/10*0.4),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: mainColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: mainColor ,
                  onPressed: ()  {
                    Navigator.of(context).pop(ConfirmAction.ACCEPT);
                    fun();
                  },
                  child: Center(child: Text('Accept',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/10*0.4,),)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
