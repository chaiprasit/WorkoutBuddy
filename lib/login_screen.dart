// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
  
}

class InitState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }


  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color(0XFFf5591F),
                gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)), (new Color(0xffF2861E))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset("assets/ex1.png"),
                      height: 90,
                      width: 90,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 20, top: 20, ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right:20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 58,
                  color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email, 
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right:20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 58,
                  color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                obscureText: true,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key, 
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10,right: 20,),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text("Forget Password?"),
                onTap: () => {

                },
              ),
            ),
            GestureDetector(
              onTap: () => {
                /*Write onClick code*/

              },    
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 78),
                padding: EdgeInsets.only(left: 20, right: 20,),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [(new Color(0xffF5591F)), (new Color(0xffF2061E))],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                    ),
                  borderRadius: BorderRadius.circular(50),  
                  boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 58,
                  color: Color(0xffEEEEEE)
                )], 
                ),
                child: Text("Login",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't Have Account?"),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SignUpScreen()
                      ))
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Color(0xffF5591F)
                      ),
                      ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}