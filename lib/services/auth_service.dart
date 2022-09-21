import 'package:flutter/material.dart';
import 'package:ole_players_app/endpoints.dart' as endpoints;
import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/models/matches.dart';
import 'package:ole_players_app/models/user.dart';

class AuthService{
  final urlAuth = "${endpoints.url}/auth/login";
  final urlLogout = "${endpoints.url}/auth/logout";
  final urlGetUser = "${endpoints.url}/user";
  final urlRegister = "${endpoints.url}/register-user";
  final IHttpClient client;


  AuthService(this.client);

  Future<String?> auth(Map login) async{
      try{
        final body = await client.post(urlAuth, login);
        return body['data']['token'];
      }catch(e){
        return null;
      }
  }

  Future<dynamic> logout(String token) async{
      try{
        final body = await client.post(urlLogout, {}, token);
        return body;
      }catch(e){
        print(e);
        return null;
      }
  }

  Future<User> getUser(String token) async{
      try{
        final body = await client.get(urlGetUser, token);

        return User.fromJson(body);
      }catch(e){
        return User();
      }
  }
  
  Future<dynamic> register(User user) async{
      try{
        final body = await client.post(urlRegister, user.toJson());
        if(body['success']){
          return body;
        }
        return body;
      }catch(e){
        print("ERRO: $e");
        return User();
      }
  }

}