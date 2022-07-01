import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ole_players_app/user/register_page.dart';
import 'package:ole_players_app/widgets/custom_appbar.dart';
import 'package:ole_players_app/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/widgets/custom_login_fab.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showEffect = false;
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: CustomAppBar(),
        // drawer: CustomDrawer(),
        body: Center(
            child: AnimatedCrossFade(
              crossFadeState: !showEffect ? CrossFadeState.showFirst: CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 700),
              firstChild: Center(
                child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .45),
                    color: const Color(0xff00b9e8),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "JÁ FEZ SEU OLÉ HOJE?",
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                          speed: Duration(milliseconds: 100)
                        ),
                      ],
                      onFinished: (){
                        setState(() {
                          showEffect = true;
                        });
                      },
                      onTap: (){
                        setState(() {
                          showEffect = true;
                        });
                      },
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 1200),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    )
                ),
              ),
              secondChild: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  color: const Color(0xff00b9e8),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                        child:
                        GestureDetector(
                          child: Image.network('https://oleplayers.com/site/images/logo.png',
                          ),
                          onTap: (){
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                        ),
                        // const Text("LOGIN",
                        //   style: TextStyle(
                        //       fontSize: 50,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.white
                        //   ),
                        // ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10),
                      //   child: const Text("JÁ FEZ SEU OLÉ HOJE?",
                      //     style: TextStyle(
                      //         fontSize: 15,
                      //         color: Colors.white
                      //     ),
                      //   ),
                      // ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
                              width: MediaQuery.of(context).size.width * .85,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Nickname ou E-mail',
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
                            GestureDetector(
                              child: Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: MediaQuery.of(context).size.width * .85,
                                child: const Text("Esqueci minha senha",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              onTap: () => print('O burro'),
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
                                  child: const Text("ENTRAR",
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
                            GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Não possui conta?  ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                    ),
                                  ),
                                  Text("Cadastre-se",
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
                                    MaterialPageRoute(builder: (context) => const RegisterPage())
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
