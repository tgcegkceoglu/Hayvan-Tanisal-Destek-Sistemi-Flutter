import 'dart:convert';
import 'package:consultant/entity/veriler.dart';
import 'package:flutter/services.dart';

class DiagosisDaoRepository{

  List<Cons> consList=[];
  List<Cons> allSpecies = [];
  final String localJsonPath = 'assets/json/veri.json';

  Future<List<Cons>> loadLocalJson() async {
    consList=[];
    var consData = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(consData);
    consList = decodedJson.map((e) => Cons.fromJson(e)).toList();
    return consList;
  }

  Future<List<Cons>> diagnosisSearch(String species, String diagnosisKeyword) async{
   allSpecies=[];
   await loadLocalJson();
   for(int i=0; i<consList.length; i++){
    List specie= consList[i].species.toLowerCase().split(",");
    List header=consList[i].header.toLowerCase().split(" ");
    List description=consList[i].description.toLowerCase().split(" ");
    List signs=consList[i].signs.toLowerCase().split(" ");
      if(species!="All"){
        species=species.toLowerCase();
        for(int j=0; j<specie.length; j++){
          if(specie[j].trim()==species){
            if(diagnosisKeyword.isNotEmpty){
              diagnosisKeyword = diagnosisKeyword.toLowerCase();
               for(int m=0; m<3; m++){
                  List search=[];
                  if(m==1){search=header;}
                  else if(m==2){search=description;}
                  else{search=signs;}

                  for(int k=0; k<search.length; k++){
                    if(search[k].trim()==diagnosisKeyword){
                      if(allSpecies.contains(consList[i])==false){
                            allSpecies.add(consList[i]);
                      }
                    }
                  }
               }
            }
            else{
              allSpecies.add(consList[i]);
            }
          }
        }
      }
      else{
        if(diagnosisKeyword.isNotEmpty){
          for(int m=0; m<3; m++){
            List search=[];
            if(m==1){search=header;}
            else if(m==2){search=description;}
            else{search=signs;}

            for(int k=0; k<search.length; k++){
              if(search[k].trim()==diagnosisKeyword){
                if(allSpecies.contains(consList[i])==false){
                      allSpecies.add(consList[i]);
                }
              }
            }
          }
        }
        else{
           allSpecies.add(consList[i]);
        }
      }
   }
    return allSpecies;
  }

  List<Cons> searchDiagnosisKeyword(String searchKeyword){
   List<Cons> cons=[];
   searchKeyword = searchKeyword.toLowerCase().trim();
   int lenght = searchKeyword.length;
   for(int i=0; i<allSpecies.length; i++){
      List specie= allSpecies[i].species.toLowerCase().split(", ");
      List header= allSpecies[i].header.toLowerCase().split(" ");
      List signs= allSpecies[i].signs.toLowerCase().split(" ");
      List description =  allSpecies[i].description.toLowerCase().split(" ");
      for(int m=0; m<4; m++){
        List search=[];
        if(m==1){search=specie;}
        else if(m==2){search=header;}
        else if(m==3){search=description;}
        else{search=signs;}
        for(int j=0; j<search.length; j++){
          for(int k=0; k<search[j].length; k++){
            if(lenght<=search[j].length){
              if(search[j].substring(0,lenght) == searchKeyword){
                if(cons.contains(allSpecies[i])==false){
                  cons.add(allSpecies[i]);
                }
              }
            }
          }
        }
      }
   }
   return cons;
  }
}

