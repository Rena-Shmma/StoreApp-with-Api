import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../helper/api.dart';
import '../models/product_model.dart';
import 'package:http/http.dart'as http;

class AllProductsService{
  Future<List<ProductModel>> getAllProducts()async{

    List<dynamic> data= await Api().get(url: 'https://fakestoreapi.com/products');
  // http.Response response= await http.get(Uri.parse("https://fakestoreapi.com/products"));

   //if(response.statusCode==200){
   //   List<dynamic> data=jsonDecode(response.body); ///List<dynamic> or Map<String, dynamic>
     List<ProductModel> productsList =[];
     for(int i=0; i<data.length; i++){
       productsList.add(ProductModel.fromJson(data[i]));
     }
     return productsList;
   // }else{
   //   throw Exception("there is problem with status code${response.statusCode}");
   // }

  }
}