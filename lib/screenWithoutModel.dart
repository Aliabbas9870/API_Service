import 'package:apiproject/apiService.dart';
import 'package:apiproject/screenWithModel.dart';
import 'package:apiproject/screenWithMultiModel.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {


dynamic singlePost;
bool isReady=false;
_getSinglePostWithoutModel(){
  isReady=true;
  ApiService().getSinglePostWithoutModel().then((value) {
    setState(() {
      singlePost=value;
      isReady=false;
      
    });
  }).onError((error, stackTrace) {
    print(error);
    isReady=false;
  });
}
@override
  void initState() {
    // TODO: implement initState
    _getSinglePostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        title: Text('Witout Model API',style:TextStyle(fontWeight: FontWeight.bold,fontSize:25)),
      ),
      body: isReady==true?
      CircularProgressIndicator():
      Padding(
        padding: const EdgeInsets.all(55.0),
        child: Column(children: [
             Text(singlePost['userId'].toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize:33)),
             Text(singlePost['title'].toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize:23,color: Colors.blueGrey)),
             Text(singlePost['body'].toString()),
              SizedBox(height: 33,),
                              Container(
                                decoration: BoxDecoration( color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(14)),
                                child: TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenWithModel()));
                                }, child: Text('Model API',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                              ),

                              SizedBox(height: 33,),
                              Container(
                                decoration: BoxDecoration( color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(14)),
                                child: TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenWithModelMul()));
                                }, child: Text(' Multi Data Model API',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                              ),
        
        
        ],),
      ),

    );
  }
}