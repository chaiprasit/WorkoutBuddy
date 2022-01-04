// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workoutbuddyapp/video_info.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      setState(() {
        info= json.decode(value);
      });
    } );
  }
  
  @override 
  void initState(){
    super.initState();
    _initData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top:70, left:30, right:30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Traininng",
                  style: TextStyle(
                    fontSize:30,
                    color:Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back,
                size:20,),
                SizedBox(width:10,),
                Icon(Icons.calendar_today_outlined,
                size:20,
                color: Colors.black),
                SizedBox(width:15,),
                Icon(Icons.arrow_forward,
                size:20,),
              ],
            ),
            SizedBox(height:25,),
            Row(
              children: [
                Text(
                  "Traininng",
                  style: TextStyle(
                    fontSize:20,
                    color:Colors.black,
                    fontWeight: FontWeight.w400
                  ),
                ),
                Expanded(child: Container()),
                    Text(
                  "Details",
                  style: TextStyle(
                    fontSize:20,
                    color:Colors.blueAccent,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Get.to(()=>ViedeoInfo());
                  },
                  child: Icon(Icons.arrow_forward,
                  size:20,
                  color:Colors.black),
                )
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900.withOpacity(0.8),
                    Colors.blue.shade200.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight
                ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      color: Colors.blue.shade900.withOpacity(0.2)
                    ),
                  ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 5,),
                      Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 5,),
                      Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.timer, size: 20, color: Colors.white),
                            SizedBox(width: 10,),
                            Text(
                            "60 min",
                            style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade900,
                                blurRadius: 10,
                                offset: Offset(4,8)
                              )
                            ]
                          ),
                          child: Icon(
                            Icons.play_circle, 
                            size:60, color: Colors.white),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              height:  180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image:AssetImage(
                          "assets/card.jpg"
                        ),
                        fit: BoxFit.fill
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(8, 10),
                          color: Colors.blue.shade900.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, -5),
                          color: Colors.blue.shade900.withOpacity(0.3),
                        )
                      ]
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin:  const EdgeInsets.only(right:  200, bottom: 20,),
                    decoration: BoxDecoration(
                      //color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image:AssetImage(
                          "assets/run.png"
                        ),
                        //fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left:  150, top: 50,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 10,),
                        RichText(text: TextSpan(
                          text: "Keep it up\n",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                            text: "stick to your plan",
                          )],
                        )),
                      ],
                    )
                  ),

                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ]
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: (info.length.toDouble()/2).toInt(),
                  itemBuilder: (_, i){
                    int a = 2*i; //0, 2,
                    int b = 2*i +1; //1, 3
                    
                    return Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 170,
                          margin: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                info[a]['img']
                              )
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: Colors.blue.shade900.withOpacity(0.1)
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: Colors.blue.shade900.withOpacity(0.1)
                              ),
                              
                            ]
                          ),
                          child: Center(
                            child:Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[a]["title"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color:Colors.black
                                ),
                              ),
                            )
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 170,
                          margin: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                info[b]['img']
                              )
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: Colors.blue.shade900.withOpacity(0.1)
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: Colors.blue.shade900.withOpacity(0.1)
                              ),
                              
                            ]
                          ),
                          child: Center(
                            child:Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[b]["title"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color:Colors.black
                                ),
                              ),
                            )
                          ),
                        ),
                      ],
                    );
                  }),
              ),
            )
              ),
          
          ],
        )
      ),
    );
  }
}