import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../modals/User.dart';


//create a class to increase reusability
class AuthService{


  final String baseurl ='http://localhost:5000/auth';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
//question mark because

  Future<AuthUser?>register(String username,String email,String password)async {
    //store values from controller in User Modal
    // User user =User(
    //    username: username,
    //   email: email,
    //   password: password,
    // );

    try{
      final res= await http.post(
        //use dollar
          Uri.parse('$baseurl/register'),
         //for json data
         headers: {
             'Content-Type': 'application/json',
         }, //
        // body: jsonEncode(user.toJson()),
        body: jsonEncode({
          username: username,
            email: email,
          password: password,})
      );
      //
      final data = jsonDecode(res.body);
      if(res.statusCode==201){
           //if registered succesfully ,
        final data = jsonDecode(res.body);
          AuthUser user = AuthUser.fromJson(data);
          //save token
          await _saveToken(user.token);
           return user;
      }
      else{
        print('Registration failed:${res.body}');
      }

    }
    catch(e){
      print(e.toString());
    }

  }
  Future<AuthUser?>login(String email,String password)async {
    //store values from controller in User Modal
    // User user =User(
    //    username: username,
    //   email: email,
    //   password: password,
    // );

    try{
      final res= await http.post(
        //use dollar
          Uri.parse('$baseurl/login'),
          //for json data
          headers: {
            'Content-Type': 'application/json',
          }, //
          // body: jsonEncode(user.toJson()),
          body: jsonEncode({
            email: email,
            password: password,})
      );
      //

      if(res.statusCode==201){
        //if registered succesfully ,
        final data = jsonDecode(res.body);
        AuthUser user = AuthUser.fromJson(data);
        //save token
        return user;
      }
      else{
        print('Login failed:${res.body}');
        return null;
      }

    }
    catch(e){
      print(e.toString());
      return null;
    }

  }

  Future<bool> isLoggedIn() async {
    String? token = await _storage.read(key: "token");
    return token != null;
  }



  Future<void>_saveToken(String ?token )async{
    await _storage.write(key: 'authToken', value: token);

  }

  Future<void>_deleteToken(String ?token )async{
    await _storage.delete(key: 'authToken');
  }
  Future<void>_getToken(String ?token )async{
    await _storage.read(key: 'authToken');
  }

}