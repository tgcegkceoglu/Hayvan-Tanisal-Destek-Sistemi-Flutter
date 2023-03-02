import 'dart:convert';
import 'package:consultant/diagnosisSearch/searchDiagnosis.dart';
import 'package:consultant/entity/veriler.dart';
import 'package:flutter/services.dart';

class DiagosisDaoRepository {
  List<Cons> consList = [];
  List<String> signList = [];
  List<Cons> allSpecies = [];
  final String localJsonPathDiagnosis = 'assets/json/veriler.json';

  Future<List<Cons>> loadLocalJsonDiagnosis() async {
    consList = [];
    var consData = await rootBundle.loadString(localJsonPathDiagnosis);
    List<dynamic> decodedJson = json.decode(consData);
    consList = decodedJson.map((e) => Cons.fromJson(e)).toList();
    return consList;
  }

  int index=0;
  Future<List<Cons>> systemSearch(String species, String signKeywords, List signs) async {
    allSpecies = [];
    
    if (consList.isEmpty) {
      await loadLocalJsonDiagnosis();
    }
    for (int i = 0; i < consList.length; i++) {
      List specie = consList[i].species.toLowerCase().split(", ");
      if (species != "All") {
        species = species.toLowerCase();
        for (int j = 0; j < specie.length; j++) {
          if (specie[j].trim() == species) {
            for (var k = 0; k < signs.length; k++) {
              if (consList[i].signs.contains(signs[k])) {
                if (!allSpecies.contains(consList[i])) {
                  allSpecies.add(consList[i]);
                }
              }
            }
            if (signKeywords.length != 0) {
              if (consList[i].signs.toLowerCase().contains(signKeywords)) {
                if (!allSpecies.contains(consList[i])) {
                  allSpecies.add(consList[i]);
                }
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

  

  Future<List<Cons>> diagnosisSearch(String species, String diagnosisKeyword) async {
    allSpecies = [];
    if (consList.isEmpty) {
      await loadLocalJsonDiagnosis();
    }
    for (int i = 0; i < consList.length; i++) {
      if(species != "All"){
        if(consList[i].species.contains(species)){
          if(diagnosisKeyword.isNotEmpty){
            print("object");
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
