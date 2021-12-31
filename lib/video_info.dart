// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViedeoInfo extends StatefulWidget {
  ViedeoInfo({Key? key}) : super(key: key);

  @override
  _ViedeoInfoState createState() => _ViedeoInfoState();
}

class _ViedeoInfoState extends State<ViedeoInfo> {
    List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      info= json.decode(value);
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900.withOpacity(0.9),
              Colors.blue.shade200,
          ],
          begin:  const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight
          )
        ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back, size: 20,
                        color: Colors.white),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.info_outline, size: 20,
                      color: Colors.white),

                  ],
                ),
                SizedBox(height: 30,),
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
                SizedBox(height: 45,),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade900,
                                Colors.blue.shade200,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer,
                              size: 20,
                              color: Colors.white
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "62 min",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70
                                ),
                              ),
                            ],
                          ),  
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: 230,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade900,
                                Colors.blue.shade200,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.handyman_outlined,
                              size: 20,
                              color: Colors.white
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Resistent band kettebell",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70
                                ),
                              ),
                            ],
                          ),  
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
              ],
            ),
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Text(
                      "Circuit 1: legs Toning",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(Icons.loop, size: 30, color: Colors.blueAccent,),
                        SizedBox(width: 10,),
                        Text(
                          "3 sets",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20,),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}