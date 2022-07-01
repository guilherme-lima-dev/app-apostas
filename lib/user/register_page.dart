import 'package:flutter/material.dart';
import 'package:ole_players_app/login/login_page.dart';
import 'package:ole_players_app/widgets/custom_appbar.dart';
import 'package:ole_players_app/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/widgets/custom_login_fab.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                      child: const Text("CADASTRE-SE",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: const Text("JÁ FEZ SEU OLÉ HOJE?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),

                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                            width: MediaQuery.of(context).size.width * .85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Nome',
                                // icon: Icon(Icons.person),
                                hintStyle: const TextStyle(color: Colors.black),
                                // border: InputBorder,
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Digite um nome de usuário ou e-mail!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                            width: MediaQuery.of(context).size.width * .85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                // icon: Icon(Icons.person),
                                hintStyle: const TextStyle(color: Colors.black),
                                // border: InputBorder,
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Digite um nome de usuário ou e-mail!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                            width: MediaQuery.of(context).size.width * .85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Confirme seu E-mail',
                                // icon: Icon(Icons.person),
                                hintStyle: const TextStyle(color: Colors.black),
                                // border: InputBorder,
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Digite um nome de usuário ou e-mail!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                            width: MediaQuery.of(context).size.width * .85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Nickname(Apelido)',
                                // icon: Icon(Icons.person),
                                hintStyle: const TextStyle(color: Colors.black),
                                // border: InputBorder,
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Digite um nome de usuário ou e-mail!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: MediaQuery.of(context).size.width * .85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Senha',
                                // icon: const Icon(Icons.lock, color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: GestureDetector(
                                  child: Icon(
                                    showPassword == false
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onTap: (){
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                ),
                              ),
                              obscureText: !showPassword,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Digite uma senha para prosseguir!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: MediaQuery.of(context).size.width * .85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Senha',
                                // icon: const Icon(Icons.lock, color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: GestureDetector(
                                  child: Icon(
                                    showPassword == false
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onTap: (){
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                ),
                              ),
                              obscureText: !showPassword,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Digite uma senha para prosseguir!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff6CB500)),
                                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.hovered))
                                        return Colors.green.withOpacity(0.04);
                                      if (states.contains(MaterialState.focused) ||
                                          states.contains(MaterialState.pressed))
                                        return Colors.green.withOpacity(0.12);
                                      return null; // Defer to the widget's default.
                                    },
                                  ),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0),
                                      )
                                  )

                              ),
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState!.validate()) {
                                  // Process data.
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                child: const Text("CADASTRAR",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .05),
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Já possui conta?  ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text("Faça o login!",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const LoginPage())
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
