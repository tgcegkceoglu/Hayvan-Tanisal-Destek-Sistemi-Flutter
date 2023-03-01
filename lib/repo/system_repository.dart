import 'dart:convert';

import 'package:consultant/systemSearch/searchSignSearch.dart';
import 'package:flutter/services.dart';

class SystemRepository{
  List<String> _systemList=[];
  final String localJsonPathSystem = 'assets/json/system.json';

  Future<List<String>> readJsonSystem(List systemNameList,String? system) async {
  _systemList=[];
  final String response = await rootBundle.loadString(localJsonPathSystem);
  final data = await json.decode(response);
  if(system == "All"){
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
      print(_systemList[i]);
      print(signKeyword);
      if(_systemList[i].toLowerCase().contains(signKeyword.toLowerCase())){
        if(!_searchList.contains(_systemList[i])){
          _searchList.add(_systemList[i]);
        }
      }
    }
    print(_searchList.length);
    return _searchList;
 }


}