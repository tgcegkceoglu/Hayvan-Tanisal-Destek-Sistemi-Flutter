import 'dart:convert';
import 'package:flutter/services.dart';

class SystemRepository{
  List<String> _systemList=[];
  final String localJsonPathSystemEng = 'assets/json/systemeng.json';
  final String localJsonPathSystemTr = 'assets/json/systemtr.json';

  Future<List<String>> readJsonSystem(List systemNameList,String? system,bool trlang) async {
  _systemList=[];
  String systemValue= trlang == true ? "Tüm" : "All";
  final String response = await rootBundle.loadString(trlang == true ? localJsonPathSystemTr : localJsonPathSystemEng);
  final data = await json.decode(response);
  if(system == systemValue){
    for (var i = 1; i < data.length; i++) {
      for (var j = 0; j < data[systemNameList[i]].length; j++) {
         _systemList.add(data[systemNameList[i]][j]);
      }
    }
  }
  else{
    for (var i = 0; i < data[system].length; i++) {
      _systemList.add(data[system][i]);
    }
  }
  return _systemList;
 }

 List<String> _searchList=[];

 Future<List<String>> searchSignTextfield(String signKeyword) async {
    _searchList=[];
    for (var i = 0; i < _systemList.length; i++) {
      if(_systemList[i].toLowerCase().contains(signKeyword.toLowerCase())){
        if(!_searchList.contains(_systemList[i])){
          _searchList.add(_systemList[i]);
        }
      }
    }
    return _searchList;
 }


}