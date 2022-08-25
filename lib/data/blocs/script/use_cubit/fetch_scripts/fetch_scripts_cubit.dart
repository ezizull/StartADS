import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_state.dart';

class FetchScriptsCubit extends Cubit<FetchScriptsState> {
  FetchScriptsCubit() : super(FetchScriptsInitial());

  Future<void> fetchScripts() async {
    emit(FetchScriptsLoading());
    try {
      emit(const FetchScriptsSuccess("Cubit: Succes to Fetch Scripts"));
    } catch (error) {
      if (error is NetworkException) {
        emit(FetchScriptsFailure.network(error.toString()));
        return;
      }
      emit(FetchScriptsFailure.general(error.toString()));
    }
  }
}
