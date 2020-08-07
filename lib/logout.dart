import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  String uid = '';
  @override
  void initState() {
  uid ='';
  FirebaseAuth.instance.currentUser().then((val){
    setState(() {
      
      this.uid = val.uid;
    });
  }).catchError((e){
    print(e);
  });
    super.initState();
  }

  Future<void> _logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=> LoginPage()),);
    } catch(e){
      print(e.toString());
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
        centerTitle: true,

      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("Welcome"),
              SizedBox(
                height: 10,
                
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 3,

                ),
                child: Text("Log out", style: TextStyle(
                  color: Colors.blue,),
                  
                  

                ),
                onPressed: (){

                  _logout();
                },
              
                
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}