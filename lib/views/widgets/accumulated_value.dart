import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccumulatedValue extends StatefulWidget{
  AccumulatedValue({Key? key, required this.valueFormatted}) : super(key: key);

  String valueFormatted;
  @override
  State<AccumulatedValue> createState() => _AccumulatedValuePageState();

}

class _AccumulatedValuePageState extends State<AccumulatedValue>{
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Text(s),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: const Center(
              child: Text("R\$",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
          ),
          for(var i=0; i < widget.valueFormatted.length; i++)
            int.tryParse(widget.valueFormatted[i]) != null
              ? _Number(number: widget.valueFormatted[i])
              : _Separator(separator: widget.valueFormatted[i]),
        ],
      ),
    );
  }

}

class _Separator extends StatelessWidget {
  const _Separator({Key? key, required this.separator}) : super(key: key);
  final String separator;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      padding: EdgeInsets.all(0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(separator,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
        ),
      ),
    );
  }
}

class _Number extends StatelessWidget {
  const _Number({Key? key, required this.number}) : super(key: key);
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.075,
      height: MediaQuery.of(context).size.height * 0.045,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFF000000),
          width: .5,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Center(
        child: Text(number,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
