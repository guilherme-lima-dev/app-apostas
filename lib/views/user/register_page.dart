import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/models/user.dart';
import 'package:ole_players_app/views/user/login/login_page.dart';
import 'package:ole_players_app/views/widgets/custom_appbar.dart';
import 'package:ole_players_app/views/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/views/widgets/custom_input_user.dart';
import 'package:ole_players_app/views/widgets/custom_login_fab.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart' as validator;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var user = User();
  bool showPassword = false;
  String? emailCache = '';
  String? emailConfirmationCache = '';
  String? passwordCache = '';
  String? passwordConfirmationCache = '';
  FToast fToast = FToast();

  @override
  void initState() {
    // TODO: implement initState
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String msg, Color color, IconData icon) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            msg,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            color: const Color(0xff00b9e8),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: const Text(
                    "CADASTRE-SE",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: const Text(
                    "JÁ FEZ SEU OLÉ HOJE?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomFormField(
                        hintText: 'Digite seu nome...',
                        labelText: 'Nome',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Você precisa digitar um nome para prosseguir!';
                          }
                          return null;
                        },
                        onSaved: (text) => user = user.copyWith(name: text),
                      ),
                      CustomFormField(
                        hintText: "E-mail",
                        labelText: "E-mail",
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || !validator.isEmail(text)) {
                            return 'Você precisa digitar um e-mail válido!';
                          }
                          if (emailCache != emailConfirmationCache) {
                            return 'Os e-mails não conferem!';
                          }
                        },
                        onChanged: (text) => emailCache = text,
                        onSaved: (text) => user = user.copyWith(email: text),
                      ),
                      CustomFormField(
                        hintText: 'Digite novamente seu e-mail...',
                        labelText: 'Confirme seu E-mail',
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? text) {
                          if (text == null || !validator.isEmail(text)) {
                            return 'Você precisa digitar um e-mail válido!';
                          }
                          if (emailCache != emailConfirmationCache) {
                            return 'Os e-mails não conferem!';
                          }
                          return null;
                        },
                        onChanged: (text) => emailConfirmationCache = text,
                        onSaved: (text) =>
                            user = user.copyWith(emailConfirmation: text),
                      ),
                      CustomFormField(
                        hintText: 'Digite seu usuário (Nickname)...',
                        labelText: 'Usuario (Nickname)',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Você precisa digitar um nome de usuário!';
                          }
                          return null;
                        },
                        onSaved: (text) => user = user.copyWith(username: text),
                      ),
                      CustomFormField(
                        hintText: 'Digite sua senha...',
                        labelText: 'Senha',
                        keyboardType: TextInputType.visiblePassword,
                        suffix: IconButton(
                          icon: Icon(showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        obscureText: !showPassword,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite uma senha para prosseguir!';
                          }
                          if (value.length < 8) {
                            return 'Sua senha precisa ter pelo menos 8 caracteres!';
                          }
                          if (passwordCache != passwordConfirmationCache) {
                            return 'As senhas não conferem!';
                          }
                          return null;
                        },
                        onChanged: (text) => passwordCache = text,
                        onSaved: (text) => user = user.copyWith(password: text),
                      ),
                      CustomFormField(
                        hintText: 'Confirme sua senha...',
                        labelText: 'Confirmação de senha',
                        keyboardType: TextInputType.visiblePassword,
                        suffix: IconButton(
                          icon: Icon(showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        obscureText: !showPassword,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite uma senha para prosseguir!';
                          }
                          if (passwordCache != passwordConfirmationCache) {
                            return 'As senhas não conferem!';
                          }
                          return null;
                        },
                        onChanged: (text) => passwordConfirmationCache = text,
                        onSaved: (text) =>
                            user = user.copyWith(passwordConfirm: text),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xff6CB500)),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.green.withOpacity(0.04);
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed))
                                    return Colors.green.withOpacity(0.12);
                                  return null; // Defer to the widget's default.
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ))),
                          onPressed: () async {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState!.validate()) {
                              authController.setLoading();
                              _formKey.currentState!.save();
                              var res = await authController.register(user);
                              if (res['success']) {
                                _showToast("Cadastro concluido com sucesso!",
                                    Colors.green, Icons.check);
                                _formKey.currentState!.reset();

                                Timer(const Duration(seconds: 2), (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginPage())
                                  );
                                });
                              } else {
                                print(res['message']);
                                _showToast(res['message'], Colors.redAccent,
                                    Icons.cancel_outlined);
                              }
                              authController.setLoading();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            child: authController.loading
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    strokeWidth: 3,
                                  )
                                : const Text(
                                    "CADASTRAR",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * .05),
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Já possui conta?  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Faça o seu login!",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
