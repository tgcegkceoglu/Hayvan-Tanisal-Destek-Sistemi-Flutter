import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  String? hinttext;
  var icon;
  var onChanged;
  TextEditingController controller;
  TextFieldWidget({required this.controller, this.hinttext, this.icon, this.onChanged});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool? backSpace;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          padding: widget.icon ==null ?  EdgeInsets.symmetric(horizontal: 16,) : EdgeInsets.only(left: 16, top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            border: Border.all(
              width: 1,
              color:Color(0xFF012340).withOpacity(.6),
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
          ),
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF023059),
            style: TextStyle(
              color: Color(0xFF023059),
            ),
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 10),
              fillColor: Colors.white,
              border: InputBorder.none,
              suffixIcon: widget.icon !=null ? widget.icon : null,
              hintText: widget.hinttext !=null ? widget.hinttext : null,
              hintStyle: TextStyle(color: Color(0xFF023059),),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,),
            ),
          ),
      ],
    );
  }
}
