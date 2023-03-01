import 'package:consultant/repo/system_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SystemCubit extends Cubit<List<String>>{
  SystemCubit() : super(<String>[]);

  var krepo=SystemRepository();

  Future<void>systemJsonRead(List systemNameList,String? system) async {
    var liste= await krepo.readJsonSystem(systemNameList,system);
    emit(liste);
  }

  Future<void>searchSignTextfield(String signKeyword) async {
    var liste= await krepo.searchSignTextfield(signKeyword);
    emit(liste);
  }

}
