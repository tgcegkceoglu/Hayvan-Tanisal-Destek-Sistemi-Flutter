import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  String? text;
  String? headerText;
  String? speciesText;
  String? signsText;
  String? descText;
  ContainerWidget({this.text, this.descText, this.headerText,this.signsText,this.speciesText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius:1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFB6E2BE),
            Color(0xFFF6F9E3),
          ],
        )
      ),
      child: text != null ? Text(text!,style:TextStyle(color: Color(0xFF003419),))
      :  Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Header",style: Theme.of(context).textTheme.labelLarge,),
              Text(headerText!.length >100 ? headerText!.substring(0,100)+"..." : headerText!,style: TextStyle(color: Color(0xFF003419)),),
              SizedBox(height: 10,),
              Text("Species",style: Theme.of(context).textTheme.labelLarge,),
              Text(speciesText!.length >100 ? speciesText!.substring(0,100)+"..." : speciesText!,style: TextStyle(color: Color(0xFF003419)),),
              SizedBox(height: 10,),
              Text("Description",style: Theme.of(context).textTheme.labelLarge,),
              Text(descText!.length >100 ? descText!.substring(0,100)+"..." : descText!,style: TextStyle(color: Color(0xFF003419)),),
              SizedBox(height: 10,),
              Text("Signs",style: Theme.of(context).textTheme.labelLarge,),
              Text(signsText!.length >100 ? signsText!.substring(0,100)+"..." : signsText!,style: TextStyle(color: Color(0xFF003419)),),
            ],
        ),
      ),
    );
  }
}