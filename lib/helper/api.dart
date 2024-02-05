import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Api{
  Future<dynamic> get({
    required String url,
    @required String? token
  })async{
    Map<String, String> headers={};

    if(token!= null){
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response= await http.get(Uri.parse(url),headers: headers);

    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("there is problem with status code${response.statusCode}");
    }

  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token
  })async{

    Map<String, String> headers={};
    
    if(token!= null){
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response=await  http.post(Uri.parse(url),
        body:body,
        headers: headers);

    Map<String,dynamic> data  =await jsonDecode(response.body);
    return data;
        //  { "title": "test",
        //   "price": 13.5,
        //   "description":"lorem ipsum set",
        //   "image":" https://i.pravatar.cc",
        //   "category": "electronic"}
        // , headers:{
        //     'Accept': 'application/json',
        //   'Content-Type': 'application/x-www-form-urlencoded'}

  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token
  })async{

    Map<String, String> headers={};
    headers.addAll({
      'Content-Type':'application/x-www-form-urlencoded'
    });
    if(token!= null){
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url= $url body= $body token= $token');

    http.Response response=await  http.post(Uri.parse(url),
        body:body,
        headers: headers);

    Map<String,dynamic> data  =await jsonDecode(response.body);
    return data;

  }
}