
import 'package:consultant/repo/diagnosisdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../entity/veriler.dart';

class DiagnosisCubit extends Cubit<List<Cons>>{
  DiagnosisCubit() : super(<Cons>[]);

  var krepo=DiagosisDaoRepository();

  Future<void>allCons() async {
    var liste= await krepo.loadLocalJsonDiagnosis();
    emit(liste);
  }

  Future<void>consSearch(String species, String diagnosisKeyword) async {
    var liste= await krepo.diagnosisSearch(species, diagnosisKeyword);
    emit(liste);
  }

  Future<void>signSearch(String species,List signs) async {
    var liste= await krepo.systemSearch(species, signs);
    emit(liste);
  }

  Future<void>searchDiagnosisKeyword(String searchDiagnosisKeyword) async {
    var liste= await krepo.searchDiagnosisKeyword(searchDiagnosisKeyword);
    emit(liste);
  }
}
