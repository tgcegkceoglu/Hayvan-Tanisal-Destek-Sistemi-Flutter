import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  bool? trlang;
  int? index;
  String? text;
  String? headerText;
  String? speciesText;
  String? signsText;
  String? descText;
  ContainerWidget({this.text,this.trlang, this.index, this.descText, this.headerText,this.signsText,this.speciesText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
        gradient:LinearGradient(
        colors: index == null ? [Color(0xFF023059),Color(0xFF012340)] : index!%2==0 ? [Color(0xFF023059),Color(0xFF012340)] :[Color.fromARGB(255, 43, 96, 143),Color.fromARGB(255, 131, 192, 245)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,),
      ),
      child: text != null ? Text(text!,style: Theme.of(context).textTheme.labelSmall)
      :  Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trlang == true ? "Başlık": "Header",style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: 5,),
              Text(headerText!.length >100 ? headerText!.substring(0,100)+"..." : headerText!,style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 12,),
              Text(trlang == true ? "Türler": "Species",style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: 5,),
              Text(speciesText!.length >100 ? speciesText!.substring(0,100)+"..." : speciesText!,style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 12,),
              Text(trlang == true ? "Açıklama": "Description",style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: 5,),
              Text(descText!.length >100 ? descText!.substring(0,100)+"..." : descText!,style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 12,),
              Text(trlang == true ? "Belirtiler / Semptomlar": "Signs",style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: 5,),
              Text(signsText!.length >100 ? signsText!.substring(0,100)+"..." : signsText!,style: Theme.of(context).textTheme.labelSmall),
            ],
        ),
      ),
    );
  }
}