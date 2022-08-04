import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          GestureDetector(
              child: Image.asset('images/logo-ole-small.png'),
              onTap: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
          ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}