import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterHomePage extends StatelessWidget {
  const FooterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1/.65,
        child: Container(
          color: Color(0xff2F2E2E),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    Text("SAC",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("+55 (11) 2628-0006",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                      onTap: ()async => await launch(Uri(scheme: "tel", path: "+55(11)2628-0006").toString()),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("sac@oleplayers.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                      onTap: ()async => await launch(Uri(scheme: 'mailto', path: 'sac@oleplayers.com').toString()),
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 35),
              //   width: MediaQuery.of(context).size.width * 0.7,
              //   child: Image.network("https://oleplayers.com/site/images/marke-360.png"),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 35),
              //   child: Text("Liquidante",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 5),
              //   width: MediaQuery.of(context).size.width * 0.7,
              //   child: Image.network("https://oleplayers.com/site/images/banco-viva.webp"),
              // )
            ],
          ),
        ),
    );
  }
}
