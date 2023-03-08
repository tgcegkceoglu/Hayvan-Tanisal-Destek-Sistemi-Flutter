
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  bool trlang;
  var onChanged;
  ButtonWidget({super.key,required this.onChanged,required this.trlang});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: widget.onChanged,
          child: Container(
            padding: EdgeInsets.all(16),
            width:MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 25, 127, 216),
                  Color(0xFF012340),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius:3,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
          ),child: Center(child: Text(widget.trlang ==true ? "ARAMA YAP" : "SEARCH",style:Theme.of(context).textTheme.headlineLarge))),
        ),
      );
  }
}