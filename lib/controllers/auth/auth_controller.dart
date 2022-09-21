import 'package:flutter/material.dart';
import 'package:ole_players_app/httpClients/dio_client.dart';
import 'package:ole_players_app/services/auth_service.dart';
import '../../models/user.dart';

class AuthController extends ChangeNotifier
{
  final AuthService service;
  var user = User();
  var token = '';
  var authenticated = false;
  var loading = false;

  AuthController(this.service);

  getUser() async{
    user = await service.getUser(token);
    notifyListeners();
  }

  setLoading(){
    loading = !loading;
    notifyListeners();
  }
  auth(Map credentials) async{

    var auth = await service.auth(credentials);

    if (auth != null) {
      token = auth;
      authenticated = true;
      getUser();
    } else {
      token = '';
      authenticated = false;
    }
    notifyListeners();
  }

  logout() async{
    var res = await service.logout(token);
    if(res != null){
      authenticated = false;
      token = '';
      user = User();
    }
    notifyListeners();
  }

  register(User user) async{
    var res = await service.register(user);

    return res;
  }


}