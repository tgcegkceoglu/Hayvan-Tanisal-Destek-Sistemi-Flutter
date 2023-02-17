import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  String? hinttext;
  bool? onkey;
  bool? onChangedbool;
  var icon;
  var onChanged;
  TextEditingController controller;
  TextFieldWidget({required this.controller, this.onChangedbool,this.hinttext, this.icon, this.onChanged,this.onkey});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool? backSpace;
  @override
  Widget build(BuildContext context) {
    return widget.onkey == true ? RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.backspace)==true){
          setState(() {
            backSpace=true;
          });
        }
        else{
          setState(() {
            backSpace=false;
          });
        }
      },
      child: container()
    ) : container() ;
  }

container(){
  return Column(
    children: [
      Text(backSpace.toString()),
      Container(
            height: 40,
            padding: widget.icon ==null ?  EdgeInsets.symmetric(horizontal: 16,) : EdgeInsets.only(left: 16, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Color(0xFFF1F7E0),
              border: Border.all(
                width: 2,
                color: Color(0xFF21774A),
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
                cursorColor: Color(0xFF21774A),
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: widget.onChangedbool == false ? null : backSpace == false ? widget.onChanged :null,
                decoration: InputDecoration(
                  contentPadding: widget.icon == null ? EdgeInsets.only(bottom: 10) : EdgeInsets.only(bottom: 12),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: widget.icon !=null ? widget.icon : null,
                  hintText: widget.hinttext !=null ? widget.hinttext : null,
                  hintStyle: TextStyle(color: Color(0xFF21774A),),
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