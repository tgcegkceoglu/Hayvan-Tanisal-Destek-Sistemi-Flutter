import 'dart:convert';
import 'package:consultant/entity/veriler.dart';
import 'package:flutter/services.dart';

class DiagosisDaoRepository {
  List<Cons> consList = [];
  List<String> signList = [];
  List<Cons> allSpecies = [];
  late bool trlang;
  final String localJsonPathDiagnosisEng = 'assets/json/verilereng.json';
  final String localJsonPathDiagnosisTr = 'assets/json/verilertr.json';

  Future<List<Cons>> loadLocalJsonDiagnosis(bool trlang) async {
    trlang = trlang;
    consList = [];
    var consData = await rootBundle.loadString(trlang == true ? localJsonPathDiagnosisTr : localJsonPathDiagnosisEng);
    List<dynamic> decodedJson = json.decode(consData);
    consList = decodedJson.map((e) => Cons.fromJson(e)).toList();
    return consList;
  }

  int index=0;
  Future<List<Cons>> systemSearch(String species, List signs,bool trlang) async {
    String speciesValue= trlang == true ? "Tüm" : "All";
    trlang=trlang;
    allSpecies = [];
    await loadLocalJsonDiagnosis(trlang);
    for (int i = 0; i < consList.length; i++) {
      if (species != speciesValue) {
        if(consList[i].species.toLowerCase().contains(species.toLowerCase())){
          if(signs.length !=0){
          if(consList[i].signs.contains(signs[0])){
            if(!allSpecies.contains(consList[i])){
                allSpecies.add(consList[i]);
            }
          }
        }
        }
      } else {
        if(signs.length !=0){
           if(consList[i].signs.contains(signs[0])){
              if(!allSpecies.contains(consList[i])){
                  allSpecies.add(consList[i]);
              }
           }
        }
        else{
          allSpecies.add(consList[i]);
        }
      }
    }
    for (var i = 0; i < allSpecies.length; i++) {
      for (var j = 1; j < signs.length; j++) {
        if(!allSpecies[i].signs.contains(signs[j])){
          allSpecies.remove(allSpecies[i]);
          i--;
        }
      }
    }
    return allSpecies;
  }

  

  Future<List<Cons>> diagnosisSearch(String species, String diagnosisKeyword,bool trlang) async {
    String speciesValue= trlang == true ? "Tüm" : "All";
    allSpecies = [];
    await loadLocalJsonDiagnosis(trlang);
    for (int i = 0; i < consList.length; i++) {
      if(species != speciesValue){
        if(consList[i].species.contains(species)){
          if(diagnosisKeyword.isNotEmpty){
             if(consList[i].description.toLowerCase().contains(diagnosisKeyword.toLowerCase()) && consList[i].signs.toLowerCase().contains(diagnosisKeyword.toLowerCase()) && consList[i].header.toLowerCase().contains(diagnosisKeyword.toLowerCase())){
                if(!allSpecies.contains(consList[i])){
                  allSpecies.add(consList[i]);
                }
             }
          }
          else 
          {
            allSpecies.add(consList[i]);
          }
        }
      }
      else{
         if(consList[i].description.toLowerCase().contains(diagnosisKeyword.toLowerCase()) && consList[i].signs.toLowerCase().contains(diagnosisKeyword.toLowerCase()) && consList[i].header.toLowerCase().contains(diagnosisKeyword.toLowerCase())){
          if(!allSpecies.contains(consList[i])){
            allSpecies.add(consList[i]);
          }
         }
      }

    }
    return allSpecies;
  }

  Future<List<Cons>> searchDiagnosisKeyword(String searchKeyword) async {
    List<Cons> cons = [];
    searchKeyword = searchKeyword.toLowerCase().trim();
    int lenght = searchKeyword.length;
    for (int i = 0; i < allSpecies.length; i++) {
      if(allSpecies[i].header.toLowerCase().contains(searchKeyword.toLowerCase())){
        if(!cons.contains(allSpecies[i])){
          cons.add(allSpecies[i]);
        }
      }
      if(allSpecies[i].description.toLowerCase().contains(searchKeyword.toLowerCase())){
        if(!cons.contains(allSpecies[i])){
          cons.add(allSpecies[i]);
        }
      }
      if(allSpecies[i].species.toLowerCase().contains(searchKeyword.toLowerCase())){
        if(!cons.contains(allSpecies[i])){
          cons.add(allSpecies[i]);
        }
      }
      if(allSpecies[i].signs.toLowerCase().contains(searchKeyword.toLowerCase())){
        if(!cons.contains(allSpecies[i])){
          cons.add(allSpecies[i]);
        }
      }
    }
    return cons;
  }
}
