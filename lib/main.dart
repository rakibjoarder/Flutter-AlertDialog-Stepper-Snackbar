import 'package:flutter/material.dart';
import 'package:flutter_bottom_navaigationbar/stepper.dart';
void main() => runApp(new MyApp());


class  MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  int index=0;
  Widget callPage(int index){
    switch(index){
      case 0 : {
        return HomePage();
        break;
      }
      case 1 : {
        return Steppers();
        break;
      }
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      theme: ThemeData.dark(),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Material App"),
        ),
        body: callPage(index),
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: index,
          onTap: (ind){

            index=ind;
             setState(() {

             });
          },
          items: [BottomNavigationBarItem(icon: new Icon(Icons.home),title: Text('Home')),BottomNavigationBarItem(icon: new Icon(Icons.merge_type),title: Text('Stepper'))],
        ),
      ),
    );;
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {

  SnackBar _snackbar(){
       return new SnackBar(
          content: new Text("Yes Snackbar Is Showing",style: TextStyle(color: Colors.black),),
          duration: new Duration(seconds: 10),
          backgroundColor: Colors.white,
          action: SnackBarAction(
              label: "Undo",
              textColor: Colors.black,
              onPressed: (){}),
        );
  }

  void _showAlertDialouge(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Center(child: Text('Alert Dialouge')),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            content: new Text("Are you Sure??"),
            contentPadding: EdgeInsets.all(10),
            titlePadding: EdgeInsets.all(20),
            actions: <Widget>[
              new FlatButton(onPressed: ()=> Navigator.of(context).pop(),
                  color: Colors.green,
                  child: new Text("Yes",style: TextStyle(color: Colors.white),)),
              new FlatButton(onPressed: ()=> Navigator.of(context).pop(),
                  color: Colors.red,
                  child: new Text("Close",style: TextStyle(color: Colors.white)))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return  new Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(colors: <Color>[
         Colors.red,
         Colors.redAccent,
       ])
     ) ,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Snackbar Code
             new RaisedButton(
                  child: new Text("Show Snackbar",style: new TextStyle(fontSize: 20,color: Colors.white),),
                  color: Colors.red,
                  padding: EdgeInsets.all(10),
                  splashColor: Colors.black12,
                  onPressed: ()=>  Scaffold.of(context).showSnackBar(_snackbar()),//Calling Snacbar function
                ),

             //AlertDialog
             new RaisedButton(
               child: new Text("Show Alert Dialouge",style: new TextStyle(fontSize: 20,color: Colors.white),),
               color: Colors.orange,
               padding: EdgeInsets.all(10),
               splashColor: Colors.black12,
               onPressed: ()=> _showAlertDialouge(),
             ),
              //Stepper
             new RaisedButton(
               child: new Text("Stepper",style: new TextStyle(fontSize: 20,color: Colors.white),),
               color: Colors.blue,
               padding: EdgeInsets.all(10),

               splashColor: Colors.black12,
               onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Steppers())),
             ),
    ],
          ),
        ),
      );
  }
}

