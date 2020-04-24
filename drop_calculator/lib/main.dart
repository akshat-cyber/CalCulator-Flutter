import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: MainApp(),
));
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int FirstNum, SecNum;

  String DisplayText = " ",Operation,res;

  Widget getObject(String item){
    return  Expanded( 
        child: OutlineButton.icon(
          padding: EdgeInsets.all(20),
          color: Colors.purple[100],
          onPressed: () => btnValue(item),
           icon: Icon(Icons.blur_linear),
           label: Text(
             "$item",
             style: TextStyle(
               fontSize: 30
             )
        ),
          )
      );
  }

  void btnValue(String buttonItm){
       if(buttonItm == "C"){
       DisplayText = " ";
       FirstNum = 0;
       SecNum = 0;
       res = " ";
       }else if(buttonItm == "+"||buttonItm == "-"||buttonItm == "X"||buttonItm == "/"){
         FirstNum = int.parse(DisplayText);
         res = " ";
         Operation = buttonItm;
       }else if(buttonItm == "="){
           SecNum = int.parse(DisplayText);
           if(Operation == "+"){
               res = (FirstNum + SecNum).toString();
           }else if(Operation == "-"){
              res = (FirstNum - SecNum).toString();
           }else if(Operation == "X"){
              res = (FirstNum * SecNum).toString();
           }else if(Operation == "/"){
              res = (FirstNum / SecNum).toString();
           } 
       }else {
          res = int.parse(DisplayText + buttonItm).toString();
       }
      setState(() {
        DisplayText = res;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
           title: Text(
             "Calculator for noobs",
             style: TextStyle(
               fontSize: 30,
               color: Colors.black87
             ),

 ),
  ),//appbar
  body: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Expanded(child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomRight,
           child: Text(
             "$DisplayText",
            style: TextStyle(
              fontSize: 60
            ),
           ),
      )
   ),
         Row(
           children: <Widget>[
             getObject("1"),
             getObject("2"),
             getObject("3"),
             getObject("+"),
           ],
         ),
         Row(
           children: <Widget>[
             getObject("4"),
             getObject("5"),
             getObject("6"),
             getObject("-"),
           ],
         ),
         Row(
           children: <Widget>[
             getObject("7"),
             getObject("8"),
             getObject("9"),
             getObject("x"),
           ],
         ),
         Row(
           children: <Widget>[
             getObject("C"),
             getObject("O"),
             getObject("/"),
             getObject("="),
           ],
         ),

    ],
    )
    );
  }
}