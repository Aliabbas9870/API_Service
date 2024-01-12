import 'package:apiproject/apiService.dart';
import 'package:apiproject/screenWithoutModel.dart';
import 'package:apiproject/singlePostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isReady = false;
  SinglePostModel singlePostModel = SinglePostModel();

  void _getSinglePost() {
    isReady = true;

    ApiService().getSinglePostModel().then((value) {
      setState(() {
        singlePostModel = value!;
        isReady = false;
      });
    }).catchError((error) {
      print(error);
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            backgroundColor: Colors.lightGreen,
          title: Text('Single  With Model',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),),
        ),
        body: isReady == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                    children: [
                      Text(singlePostModel.userId.toString(),
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple)),
                      Text(singlePostModel.title.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      Text(singlePostModel.body.toString(),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                              SizedBox(height: 33,),
                              Container(
                                
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(14)),
                                child: TextButton(onPressed: (){
                                  
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenWithoutModel()));
                                }, child: Text(' Without Mode API',style: TextStyle(color: Colors.white),)),
                              )
                    ],
                  ),
              ),
            ));
  }
}
