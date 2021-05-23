import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';


class SoleDesign extends StatefulWidget {
  final Function onNext;
  final Function(String image) onChange;
  final Function(Color c) onColor;
  final Function(String ac) onAc;

  const SoleDesign({Key key, this.onNext, this.onChange, this.onColor, this.onAc}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SoleDesign> {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
  String se = "Basic";
  @override
  Widget build(BuildContext context)  {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(flex: 3),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: redColor, shape: BoxShape.circle),
                                child: Image.asset('assets/images/image.png', height: 12),
                              ),
                              Text(
                                'ADD A DESIGN',
                                style: const TextStyle(fontSize: 15, color: Color.fromRGBO(186, 190, 197, 1)),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        se = "Basic";
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Container(
                        width: MediaQuery.of(context).size.width/12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child:
                              Center(child: Text('Basic',
                                  style: const TextStyle(fontSize: 12, color: Colors.deepOrange)
                              ,maxLines: 1,)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                  SizedBox(width: MediaQuery.of(context).size.height/100,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        se = "Wooden";
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Container(
                        width: MediaQuery.of(context).size.width/12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child:
                              Center(child: Text(
                                  'Wooden', style: const TextStyle(fontSize: 12, color: Colors.deepOrange),maxLines: 1)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                  SizedBox(width: MediaQuery.of(context).size.height/100,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        se = "Printed";

                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Container(
                        width: MediaQuery.of(context).size.width/12,
                        decoration: BoxDecoration
                          (borderRadius: BorderRadius.circular(25), color: Colors.white),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child:
                              Center(child: Text('Printed', style: const TextStyle(fontSize: 12, color: Colors.deepOrange),maxLines: 1)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),

                ],
              ),

              SizedBox(height: 10,),
              Center(child:Text(se+' bottoms', style: TextStyle(fontSize: MediaQuery.of(context).size.width/40, color: Color.fromRGBO(146, 146, 146, 1), letterSpacing: 1.6)),),
              SizedBox(height: 5,),
              se == "Basic"
              ?Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4, maxWidth: MediaQuery.of(context).size.width/2.5),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 80, mainAxisSpacing: 16, crossAxisSpacing: 20),
                        itemBuilder: (_, index) => ImageFrame(
                          key: UniqueKey(),
                          image: images[index],
                          baseColor: BaseLayerColor[index],
                          onSelected: widget.onChange,
                          onColor: widget.onColor,
                          onAc: widget.onAc,
                        ),
                        itemCount: images.length,
                      ),
                    ),
                  ))
              :se == "Wooden"
              ?Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4, maxWidth: MediaQuery.of(context).size.width/2.5),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 80, mainAxisSpacing: 16, crossAxisSpacing: 20),
                        itemBuilder: (_, index) => ImageFrame(
                          key: UniqueKey(),
                          image: Woimages[index],
                          onSelected: widget.onChange,
                          onColor: widget.onColor,
                          onAc: widget.onAc,
                        ),
                        itemCount: Woimages.length,
                      ),
                    ),
                  ))
              :Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4, maxWidth: MediaQuery.of(context).size.width/2.5),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 80, mainAxisSpacing: 16, crossAxisSpacing: 20),
                        itemBuilder: (_, index) => ImageFrame(
                          key: UniqueKey(),
                          image: Custimages[index],
                          onSelected: widget.onChange,
                          onColor: widget.onColor,
                          onAc: widget.onAc,
                        ),
                        itemCount: Custimages.length,
                      ),
                    ),
                  )),


              SizedBox(height: 25),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: TextButton(
                    onPressed: widget.onNext,
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: redColor),
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child:
                            Center(child: Text('NEXT STEP', style: const TextStyle(fontSize: 12, color: Colors.white))),
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
            ],
          ),
        )
      ],
    );
  }
}


//this should take an image path as parameter
class ImageFrame extends StatelessWidget {
  final Function(String image) onSelected;
  final Function(Color cc) onColor;
  final Function(String x) onAc;
  final String image;
  final String ac;
  final Color baseColor;

  const ImageFrame({Key key, @required this.onSelected, @required this.image, this.baseColor, this.onColor, this.onAc, this.ac}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextButton(
        onPressed: () {
          onSelected(image);
          onColor(baseColor);
          onAc(ac);
        } ,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 0.5)),
          child: Image.asset(image + '.png',color: baseColor,),
        ),
      ),
    );
  }
}
