// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ViedeoInfo extends StatefulWidget {
  ViedeoInfo({Key? key}) : super(key: key);

  @override
  _ViedeoInfoState createState() => _ViedeoInfoState();
}

class _ViedeoInfoState extends State<ViedeoInfo> {
    List videoInfo=[];
    bool _playArea=false;
    late VideoPlayerController _controller;
  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      setState(() {
        videoInfo= json.decode(value);
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
      body: Container(
        decoration: _playArea==false?BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900.withOpacity(0.9),
              Colors.blue.shade200,
          ],
          begin:  const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight
          )
        ):BoxDecoration(
          color: Color(0xFF6985E8),
        ),
      child: Column(
        children: [
          _playArea==false?Container(
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
          ):Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 40, left: 30,right: 30,),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          debugPrint("tapped");
                        },
                        child: Icon(Icons.arrow_back_ios_new,
                        size:20,
                        color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.info_outline, 
                      size: 20,
                      color: Colors.white)
                    ],
                  ),
                ),
                _playView(context),
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
                ),
                SizedBox(height: 20,),
                Expanded(child: _listView()),
              ],
            ),
          ))
        ],
      ),
    ));
  }
  Widget _playView(BuildContext context){
    final controller =_controller;
    if(controller!=null&&controller.value.isInitialized){
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(controller),
      );
    }else{
      return Text("Being initialized pls wait");
    }
  }
  _onTapVideo(int index){
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    _controller=controller;
    setState(() {

    });
    controller..initialize().then((_){
      controller.play();
      setState(() {

      });
    });
  }
  _listView(){
    return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                  itemCount: videoInfo.length,
                  itemBuilder: (_, int index){

                  return GestureDetector(
                    onTap: (){
                      _onTapVideo(index);
                      debugPrint(index.toString());
                      setState(() {
                        if(_playArea==false){
                          _playArea=true;
                        }
                      });
                    },
                    child: _buildCard(index),
                    
                  );
                });
  }

  _buildCard(int index){
    return Container(
                      height: 135,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image:DecorationImage(
                                    image: AssetImage(
                                      videoInfo[index]["thumbnail"]
                                    ),
                                    fit: BoxFit.cover
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    videoInfo[index]["title"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: EdgeInsets.only(top:3),
                                    child: Text(
                                      videoInfo[index]["time"],
                                      style: TextStyle(
                                        color: Colors.grey[500]
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 18,),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFeaeefc),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "15s rest",style: TextStyle(
                                    color: Color(0xFF839fed),
                                  )
                                ),
                              ),
                              ),
                              Row(
                                children: [
                                  for(int i=0; i<70; i++)
                                  i.isEven?Container(
                                    width: 3,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF839fed),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ):Container(
                                    width: 3,
                                    height: 1,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
  }
}