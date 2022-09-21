import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType keyboardType;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String? text)? onChanged;

  const CustomFormField({Key? key,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.suffix,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery
            .of(context)
            .size
            .width * .85,
        child: TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              labelStyle: const TextStyle(
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
              // icon: Icon(Icons.person),
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              // border: InputBorder,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    style: BorderStyle.none, color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: suffix),
          obscureText: obscureText,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
        ));
  }
}
