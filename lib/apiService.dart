import 'dart:convert';
import 'package:apiproject/singlePostModel.dart';
import 'package:http/http.dart' as http;

class ApiService {

  //with mode fetch data
  Future<SinglePostModel?> getSinglePostModel() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        SinglePostModel model =
            SinglePostModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
//without single data fetch


 Future<dynamic> getSinglePostWithoutModel() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var response = await http.get(url);

      if (response.statusCode == 200) {
     final Body=response.body;
     final data =jsonDecode(Body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }







  Future<List <MultiDataModel>?> getMultiDataModel() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<MultiDataModel> model
         =
             List<MultiDataModel>.from(json.decode(response.body).map((x)=>MultiDataModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }





}
