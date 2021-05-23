import 'package:flutter/material.dart';
import 'accessories.dart';
import 'constants.dart';
import 'customize_screen.dart';

class StrapColor extends StatefulWidget {
  final VoidCallback onPrevious;
  final Function([Color color, int size, bool isMale,String access]) onChange;
  final Function([Color color, int size, bool isMale,String access]) onAccChange;
  final VoidCallback onFinish;

  const StrapColor({Key key, this.onPrevious, this.onChange, this.onFinish, this.onAccChange}) : super(key: key);

  @override
  _StrapColorState createState() => _StrapColorState();
}

class _StrapColorState extends State<StrapColor> {
  bool _isMale;
  int _size;
  Color _color;
  String _access;
  String _sizeCm;

  @override
  void initState() {
    _isMale = true;
    _size = size[0];
    _color = KColorsList[0];
    _access = access[0];
    super.initState();
  }
  String co = "";
  String accSelect = "";
  String wC = "basic";

  @override
  Widget build(BuildContext context) {
    return accSelect == ""
    ?ListView(
      children: [
        Center(child:Text('Are you ..?', style: TextStyle(fontSize: MediaQuery.of(context).size.width/40, color: Color.fromRGBO(146, 146, 146, 1), letterSpacing: 1.6)),),
        SizedBox(height: MediaQuery.of(context).size.height/50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  co = "women";
                  _isMale = false;

                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child:Container(
                  width: MediaQuery.of(context).size.width/12,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: redColor),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child:
                        Center(child: Text('Woman', style: const TextStyle(fontSize: 12, color: Colors.white),maxLines: 1)),
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
                  co = "girl";
                  _isMale = false;

                });
              },
              child: Container(

                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width/12,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: redColor),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:
                          Center(child: Text('Girl', style: const TextStyle(fontSize: 12, color: Colors.white),maxLines: 1)),
                        ),
                      ],
                    ),
                  ),
                ),

              ),

            ),
            SizedBox(width: MediaQuery.of(context).size.height/100,),
            GestureDetector(
              onTap: (){
                setState(() {
                  co = "boy";
                  _isMale = true;

                });
              },
              child: Container(

                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width/12,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: redColor),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:
                          Center(child: Text('Boy', style: const TextStyle(fontSize: 12, color: Colors.white),maxLines: 1)),
                        ),
                      ],
                    ),
                  ),
                ),

              ),

            ),
            SizedBox(width: MediaQuery.of(context).size.height/100,),
            GestureDetector(
              onTap: (){
                setState(() {
                  co = "men";
                  _isMale = true;

                });
              },
              child: Container(

                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width/10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: redColor),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:
                          Center(child: Text('Man', style: const TextStyle(fontSize: 12, color: Colors.white),maxLines: 1)),
                        ),
                      ],
                    ),
                  ),
                ),

              ),

            ),

          ],
        ),
        SizedBox(height: 8,),

        Center(child:Text("Strap color for.."+" "+co.toUpperCase(), style: TextStyle(fontSize: MediaQuery.of(context).size.width/40, color: Color.fromRGBO(146, 146, 146, 1), letterSpacing: 1.6)),),

        SizedBox(height: 8,),
        co == "women"
            ? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      wC = "basic";
                      _isMale = false;

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
                            Center(child: Text('Basic', style: const TextStyle(fontSize: 12, color: Colors.deepOrange),maxLines: 1)),
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
                      wC = "glitter";
                      _isMale = false;

                    });
                  },
                  child: Container(

                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: MediaQuery.of(context).size.width/12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child:
                              Center(child: Text('Glitter', style: const TextStyle(fontSize: 12, color: Colors.deepOrange),maxLines: 1)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),

                ),
                SizedBox(width: MediaQuery.of(context).size.height/100,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      wC = "metallic";
                      _isMale = true;

                    });
                  },
                  child: Container(

                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: MediaQuery.of(context).size.width/12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child:
                              Center(child: Text('Metallic', style: const TextStyle(fontSize: 12, color: Colors.deepOrange),maxLines: 1)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),

                ),
                SizedBox(width: MediaQuery.of(context).size.height/100,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      wC = "neon";
                      _isMale = true;

                    });
                  },
                  child: Container(

                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: MediaQuery.of(context).size.width/12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child:
                              Center(child: Text('Neon', style: const TextStyle(fontSize: 12, color: Colors.deepOrange),maxLines: 1)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),

                ),
              ],
            ),
            SizedBox(height: 5,),
            wC=="basic"
                ?Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
                child: Scrollbar(
                  isAlwaysShown:true,
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
            )
                :wC=="glitter"
                ?Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
                child: Scrollbar(
                  isAlwaysShown:true,
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 50, mainAxisSpacing: 20, crossAxisSpacing: 20),
                      itemCount: GColorsList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) => ColorBox(
                        key: UniqueKey(),
                        color: GColorsList[index],
                        onSelected: (Color color) => setState(() {
                          _color = color;
                          widget.onChange(_color, _size, _isMale,_access);
                        }),
                        selected: _color == GColorsList[index],
                      )),
                ),
              ),
            )
                :wC=="metallic"
                ?Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
                child: Scrollbar(
                  isAlwaysShown:true,
                  child:  GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 50, mainAxisSpacing: 20, crossAxisSpacing: 20),
                      itemCount: MColorsList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) => ColorBox(
                        key: UniqueKey(),
                        color: MColorsList[index],
                        onSelected: (Color color) => setState(() {
                          _color = color;
                          widget.onChange(_color, _size, _isMale,_access);
                        }),
                        selected: _color == MColorsList[index],
                      )),
                ),
              ),
            )
                :Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
                child: Scrollbar(
                  isAlwaysShown:true,
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 50, mainAxisSpacing: 20, crossAxisSpacing: 20),
                      itemCount: NColorsList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) => ColorBox(
                        key: UniqueKey(),
                        color: NColorsList[index],
                        onSelected: (Color color) => setState(() {
                          _color = color;
                          widget.onChange(_color, _size, _isMale,_access);
                        }),
                        selected: _color == NColorsList[index],
                      )),
                ),
              ),
            )
          ],
        )
            :co == "girl"
            ?Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
            child: Scrollbar(
              isAlwaysShown:true,
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 50, mainAxisSpacing: 20, crossAxisSpacing: 20),
                  itemCount: GirlsColorsList.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => ColorBox(
                    key: UniqueKey(),
                    color: GirlsColorsList[index],
                    onSelected: (Color color) => setState(() {
                      _color = color;
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                    selected: _color == GirlsColorsList[index],
                  )),
            ),
          ),
        )
            :co == "boy"
            ?Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
            child: Scrollbar(
              isAlwaysShown:true,
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 50, mainAxisSpacing: 20, crossAxisSpacing: 20),
                  itemCount: BoysColorsList.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => ColorBox(
                    key: UniqueKey(),
                    color: BoysColorsList[index],
                    onSelected: (Color color) => setState(() {
                      _color = color;
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                    selected: _color == BoysColorsList[index],
                  )),
            ),
          ),
        )
            :co == "men"
            ?Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.22),
            child:Scrollbar(
              isAlwaysShown:true,
              child:  GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 50, mainAxisSpacing: 20, crossAxisSpacing: 20),
                  itemCount: MenColorsList.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => ColorBox(
                    key: UniqueKey(),
                    color: MenColorsList[index],
                    onSelected: (Color color) => setState(() {
                      _color = color;
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                    selected: _color == MenColorsList[index],
                  )),
            ),
          ),
        )
            :Container(),


        SizedBox(height: MediaQuery.of(context).size.height/50,),
        Center(child:Text('Choose size', style: TextStyle(fontSize: MediaQuery.of(context).size.width/40, color: Color.fromRGBO(146, 146, 146, 1), letterSpacing: 1.6)),),
        SizedBox(height: MediaQuery.of(context).size.height/50,),
        co == "girl"
            ?Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Gsize.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBox(
                    key: UniqueKey(),
                    size: Gsize[index],
                    onSelected: (int size) => setState(() {
                      _size = size;
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                    isSelected: _size == Gsize[index],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Gsizecm.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBoxcm(
                    key: UniqueKey(),
                    size: Gsizecm[index],
                    onSelected: (String size) => setState(() {
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                  )),
            )

          ],
        )
            :co == "women"
            ?Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Wsize.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBox(
                    key: UniqueKey(),
                    size: Wsize[index],
                    onSelected: (int size) => setState(() {
                      _size = size;
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                    isSelected: _size == Wsize[index],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Wsizecm.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBoxcm(
                    key: UniqueKey(),
                    size: Wsizecm[index],
                    onSelected: (String size) => setState(() {
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                  )),
            )

          ],
        )
            :co == "boy"
            ?Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Bsize.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBox(
                    key: UniqueKey(),
                    size: Bsize[index],
                    onSelected: (int size) => setState(() {
                      _size = size;
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                    isSelected: _size == Bsize[index],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Bsizecm.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBoxcm(
                    key: UniqueKey(),
                    size: Bsizecm[index],
                    onSelected: (String size) => setState(() {
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                  )),
            )

          ],
        )
            :co == "men"
            ?Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Msize.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBox(
                    key: UniqueKey(),
                    size: Msize[index],
                    onSelected: (int size) => setState(() {
                      _size = size;
                      widget.onChange(_color, _size, _isMale,_access);
                    }),
                    isSelected: _size == Msize[index],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.5),
                  itemCount: Msizecm.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => SizeBoxcm(
                    key: UniqueKey(),
                    size: Msizecm[index],
                    onSelected: (String size) => setState(() {
                      widget.onChange(_color, _size, _isMale,_access);

                    }),
                    isSelected: _size == Msizecm[index],
                  )),
            )

          ],
        )
            :Container(),


        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: TextButton(
                  onPressed: widget.onPrevious,
                  child: Container(
                    width: MediaQuery.of(context).size.width/10,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25), color: Color.fromRGBO(62, 62, 62, 1)),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(Icons.arrow_back_ios_outlined, color: Color.fromRGBO(62, 62, 62, 1), size: 18),
                          ),
                        ),
                        Center(
                            child: Text('PREVIOUS'
                                ,maxLines: 1
                                , style: const TextStyle(fontSize: 9, color: Colors.white))),
                      ],
                    ),
                  )),
            ),
            SizedBox(width: MediaQuery.of(context).size.width/30),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: TextButton(
                  onPressed: (){
                    setState(() {
                      accSelect = "Selected";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: redColor),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:
                          Center(child: Text('Add Accessories'
                              ,maxLines: 1, style: const TextStyle(fontSize: 9, color: Colors.white))),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Icon(Icons.arrow_forward_ios_outlined, color: redColor, size: 18),
                        ),
                      ],
                    ),
                  )),
            ),


          ],
        ),
        SizedBox(height: 8,)
      ],
    )
    :ListView(
      children: [
        Center(child:Text('Select Accessories', style: TextStyle(fontSize: MediaQuery.of(context).size.width/40, color: Color.fromRGBO(146, 146, 146, 1), letterSpacing: 1.6)),),
        SizedBox(height: MediaQuery.of(context).size.height/90,),
        Scrollbar(
            isAlwaysShown: true,
            child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450, maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  mainAxisSpacing: 20, crossAxisSpacing: 20),
              itemCount: access.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => AcBox(
                key: UniqueKey(),
                acc: index.toString(),
                onSelected: (String ac) => setState(()
                {
                  _access = ac;
                  widget.onAccChange(_color, _size, _isMale,_access);

                }),
                selected: _access == access[index],
              )),
        )),
        SizedBox(height: MediaQuery.of(context).size.height/40,),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: TextButton(
                  onPressed: (){
                    setState(() {
                      accSelect = "";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/10,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25), color: Color.fromRGBO(62, 62, 62, 1)),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(Icons.arrow_back_ios_outlined, color: Color.fromRGBO(62, 62, 62, 1), size: 18),
                          ),
                        ),
                        Expanded(
                          child: Center(
                              child: Text('PREVIOUS STEP'
                                  ,maxLines: 1
                                  , style: const TextStyle(fontSize: 12, color: Colors.white))),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(width: MediaQuery.of(context).size.width/30),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: TextButton(
                  onPressed: widget.onFinish,
                  child: Container(
                    width: MediaQuery.of(context).size.width/10,
                    decoration: BoxDecoration
                      (borderRadius: BorderRadius.circular(25), color: redColor),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:
                          Center(child: Text('FINISH'
                              ,maxLines: 1, style: const TextStyle(fontSize: 12, color: Colors.white))),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Icon(Icons.arrow_forward_ios_outlined, color: redColor, size: 18),
                        ),
                      ],
                    ),
                  )),
            ),

          ],
        )
      ],
    );
  }
}

class SizeBox extends StatelessWidget {
  final int size;
  final bool isSelected;
  final Function(int size) onSelected;


  const SizeBox({Key key, @required this.size, this.isSelected = false, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onSelected(size),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: <BoxShadow>[
          BoxShadow(color: Color.fromRGBO(114, 124, 142, 0.15), offset: Offset(0, 8), blurRadius: 10)
        ]),
        child: Center(
          child: Text(
            '$size'+" EU",
            softWrap: false,
            style: TextStyle(fontSize: 15, color: isSelected == true ? redColor : Color.fromRGBO(114, 124, 142, 1)),
          ),
        ),
      ),
    );
  }
}

class SizeBoxcm extends StatelessWidget {
  final String size;
  final bool isSelected;
  final Function(String size) onSelected;


  const SizeBoxcm({Key key, @required this.size, this.isSelected = false, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onSelected(size),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: <BoxShadow>[
          BoxShadow(color: Color.fromRGBO(114, 124, 142, 0.15), offset: Offset(0, 8), blurRadius: 10)
        ]),
        child: Center(
          child: Text(
            '$size',
            softWrap: false,
            style: TextStyle(fontSize: 9, color: isSelected == true ? redColor : Color.fromRGBO(114, 124, 142, 1)),
          ),
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color color;
  final bool selected;
  final bool select;
  final Function(Color color) onSelected;

  const ColorBox({Key key, @required this.color, this.selected = false, this.onSelected, this.select}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLight = color.blue + color.green + color.red >= 600;
    return TextButton(
      onPressed: () => onSelected(color),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15), boxShadow: <BoxShadow>[
          BoxShadow(color: Color.fromRGBO(114, 124, 142, 0.15), offset: Offset(0, 5), blurRadius: 10)
        ]),
        child: Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[
              BoxShadow(color: Color.fromRGBO(114, 124, 142, 0.15), offset: Offset(0, 5), blurRadius: 10)
            ]),
            child: Icon(selected ? Icons.check_outlined : null,
                color: _isLight ? Color.fromRGBO(62, 62, 62, 1) : Colors.white, size: 25)),
      ),
    );
  }
}

class AcBox extends StatelessWidget {
  final String acc;
  final bool selected;
  final bool select;
  final Function(String ac) onSelected;

  const AcBox({Key key, @required this.acc, this.selected = false, this.onSelected, this.select}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          onSelected(acc),
      child: Container(

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5), boxShadow: <BoxShadow>[
          BoxShadow(color: Color.fromRGBO(114, 124, 142, 0.15),
              offset: Offset(0, 8), blurRadius: 10)
        ]),
        padding: const EdgeInsets.all(10),
        child: Image.asset("assets/acx/" +acc+".png", width: 100,
          height: 100,),
      ),
    );
  }
}


class CustomRadio extends StatelessWidget {
  final Function(bool value) onChanged;
  final groupValue;
  final value;
  final Widget child;

  const CustomRadio({Key key, this.onChanged, this.groupValue, this.value, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextButton(
        onPressed: () => onChanged(groupValue),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            Container(
              //height: 20,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: value == groupValue ? Color.fromRGBO(243, 81, 46, 1) : Colors.white, shape: BoxShape.circle),
              child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: value == groupValue ? Colors.white : null, shape: BoxShape.circle)),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
