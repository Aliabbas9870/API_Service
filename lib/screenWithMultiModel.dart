import 'package:apiproject/apiService.dart';
import 'package:apiproject/screenWithoutModel.dart';
import 'package:apiproject/singlePostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScreenWithModelMul extends StatefulWidget {
  const ScreenWithModelMul({super.key});

  @override
  State<ScreenWithModelMul> createState() => _ScreenWithModelMulState();
}

class _ScreenWithModelMulState extends State<ScreenWithModelMul> {
  bool isReady = false;
  
List<MultiDataModel> multiDataModel=[];
  void _getMultiPost() {
    isReady = true;

    ApiService().getMultiDataModel().then((value) {
      setState(() {
        multiDataModel = value!;
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
    _getMultiPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            backgroundColor: Colors.lightGreen,
          title: Text('MultiPle Data  With Model',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),),
        ),
        body: isReady == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: ListView.builder(
                  itemCount: multiDataModel.length,
                  itemBuilder: (context,ind){
                  return Card(
                    child: ListTile(
                      leading: Text(multiDataModel[ind].id.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize:16)),
                       title: Text(multiDataModel[ind].title.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize:19,color: Colors.purple)),
                       subtitle: Text(multiDataModel[ind].body.toString()),   
                       trailing: CircleAvatar(child: Text(multiDataModel[ind].userId.toString())),                 ),
                  );
                })
              ),
            ));
  }
}
