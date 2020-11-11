import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future getData() async{
   Response response= await get(url);
   if (response.statusCode==200){
     var data= response.body;
     var decodeData = jsonDecode(data);
     return decodeData;
     print('TCP connection extablished with server');
   }
   else{
     print('TCP Connection error ');
   }

  }
}
