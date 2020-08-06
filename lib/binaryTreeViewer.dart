import 'dart:io';

import 'package:binary_tree_viewer/binaryTree.dart';
import 'package:binary_tree_viewer/reusableWidgets.dart';
import 'package:binary_tree_viewer/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BinaryTreeViewerScreen extends StatefulWidget {
  @override
  State<BinaryTreeViewerScreen> createState() => BinaryTreeViewerScreenState();
}

class BinaryTreeViewerScreenState extends State<BinaryTreeViewerScreen> {
  bool initer = true;

  BinaryTree tree = new BinaryTree();


  static final path = [
    "",
    "l",/**/ "r",
    "ll", "lr", /**/"rr", "rl",
    "lll", "llr", "lrl", "lrr",/**/ "rrr", "rrl", "rlr", "rll",
    "llll", "lllr", "llrl", "llrr", "lrll", "lrlr", "lrrl", "lrrr", /**/"rrrr", "rrrl", "rrlr", "rrll", "rlrr", "rlrl", "rllr", "rlll"
  ];

  static final num = [
    "",
    "",/**/ "",
    "", "", /**/"", "",
    "", "", "", "",/**/ "", "", "", "",
    "", "", "", "", "", "", "", "", /**/"", "", "", "", "", "", "", ""
  ];

  static final color = [
  Colors.white,
  Colors.white,/**/ Colors.white,
  Colors.white, Colors.white, /**/Colors.white, Colors.white,
  Colors.white, Colors.white, Colors.white, Colors.white,/**/ Colors.white, Colors.white, Colors.white, Colors.white,
  Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, /**/Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white
  ];


  updateValue(key, pos){
    print(pos);
    num[path.indexOf(pos)] = key.toString();

    colorAnimator(pos);
    sleep(new Duration(milliseconds: 50));
    colorAnimator(pos);
    sleep(new Duration(milliseconds: 50));
    colorAnimator(pos);
  }

  colorAnimator(pos){
    color[path.indexOf(pos)] = Colors.purple;
    sleep(new Duration(milliseconds: 200));
    color[path.indexOf(pos)] = Colors.white;
  }


  TextEditingController myController = new TextEditingController();

  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Árbol Binario", style: TextStyle(color: Color.fromARGB(255, 220, 220, 220)),),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 30/10,
                child: Container(
                  child: Center(
                    child: Text(
                      "Agrega elementos al árbol",
                      style: TextStyle(color: Colors.white, fontSize: SizeConfig.fixLilHor*44),
                    ),
                  ),
                  color: Colors.deepPurple,
                ),
              ),
              AspectRatio(
                aspectRatio: 30/4,
                child: Container(
                  color: Colors.white,
                ),
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: myController,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      right: SizeConfig.fixLil * 15, left: SizeConfig.fixLil * 15),
                  border: OutlineInputBorder(),
                  hintText: "Número",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                onChanged: (text) {
                  if(int.parse(text) > 99){
                    myController.text = "99";
                  }
                  if(int.parse(text) < -99){
                    myController.text = "-99";
                  }
                },
              ),
              RaisedButton(
                shape: CircleBorder(),
                disabledColor: Colors.blueGrey,
                disabledTextColor: Colors.black,
                color: Colors.blueAccent,
                textColor: Colors.white,
                elevation: 5.0,
                onPressed: () {
                  setState(() {
                    //print("hola");
                    tree.insertion(int.parse(myController.text));
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),


        body: Stack(
          children: [



            Positioned(
              right:  SizeConfig.fixAllHor * 0.2,
              top: SizeConfig.fixAllVer * 4.4,
              child: ReusableWidgets.nodeContainer(num[0], color[0])
            ),

            //////////////////////////////////////////////////////////

            Positioned(
                right:  SizeConfig.fixAllHor * 2,
                top: SizeConfig.fixAllVer * 1.95,
                child: ReusableWidgets.nodeContainer(num[1], color[1])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 2.0,
                top: SizeConfig.fixAllVer * 6.85,
                child: ReusableWidgets.nodeContainer(num[2], color[2])
            ),

            //////////////////////////////////////////////////////////

            Positioned(
                right:  SizeConfig.fixAllHor * 4,
                top: SizeConfig.fixAllVer * 0.95,
                child: ReusableWidgets.nodeContainer(num[3], color[3])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 4.0,
                top: SizeConfig.fixAllVer * 2.95,
                child: ReusableWidgets.nodeContainer(num[4], color[4])
            ),


            Positioned(
                right:  SizeConfig.fixAllHor * 4,
                top: SizeConfig.fixAllVer * 7.85,
                child: ReusableWidgets.nodeContainer(num[5], color[5])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 4.0,
                top: SizeConfig.fixAllVer * 5.85,
                child: ReusableWidgets.nodeContainer(num[6], color[6])
            ),

            ////////////////////////B Mid Left 8

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 0.45,
                child: ReusableWidgets.nodeContainer(num[7], color[7])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 1.45,
                child: ReusableWidgets.nodeContainer(num[8], color[8])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 2.45,
                child: ReusableWidgets.nodeContainer(num[9], color[9])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 3.45,
                child: ReusableWidgets.nodeContainer(num[10], color[10])
            ),

            //// L

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 8.35,
                child: ReusableWidgets.nodeContainer(num[11], color[11])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 7.35,
                child: ReusableWidgets.nodeContainer(num[12], color[12])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 6.35,
                child: ReusableWidgets.nodeContainer(num[13], color[13])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 6.4,
                top: SizeConfig.fixAllVer * 5.35,
                child: ReusableWidgets.nodeContainer(num[14], color[14])
            ),

            ///////////////////////////////////////////////////////// BOTTOM //////// 16
            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 0.2,
                child: ReusableWidgets.nodeContainer(num[15], color[15])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 0.7,
                child: ReusableWidgets.nodeContainer(num[16], color[16])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 1.2,
                child: ReusableWidgets.nodeContainer(num[17], color[17])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 1.7,
                child: ReusableWidgets.nodeContainer(num[18], color[18])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 2.2,
                child: ReusableWidgets.nodeContainer(num[19], color[19])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 2.7,
                child: ReusableWidgets.nodeContainer(num[20], color[20])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 3.2,
                child: ReusableWidgets.nodeContainer(num[21], color[21])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 3.7,
                child: ReusableWidgets.nodeContainer(num[22], color[22])
            ),

            /////// B Right
            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 8.6,
                child: ReusableWidgets.nodeContainer(num[23], color[23])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 8.1,
                child: ReusableWidgets.nodeContainer(num[24], color[24])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 7.6,
                child: ReusableWidgets.nodeContainer(num[25], color[25])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 7.1,
                child: ReusableWidgets.nodeContainer(num[26], color[26])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 6.6,
                child: ReusableWidgets.nodeContainer(num[27], color[27])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 6.1,
                child: ReusableWidgets.nodeContainer(num[28], color[28])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 5.6,
                child: ReusableWidgets.nodeContainer(num[29], color[29])
            ),

            Positioned(
                right:  SizeConfig.fixAllHor * 9.0,
                top: SizeConfig.fixAllVer * 5.1,
                child: ReusableWidgets.nodeContainer(num[30], color[30])
            ),




          ],
        ),
      )
    );
  }

}