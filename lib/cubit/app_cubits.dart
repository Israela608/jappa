import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jappa/cubit/app_cubit_states.dart';
import 'package:jappa/model/data_model.dart';
import 'package:jappa/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  // We initialize the first state
  AppCubits({required this.data}) : super(InitialState()) {
    //We trigger another state 'WelcomeState()'
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  //Function that gets the data from the backend
  void getData() async {
    try {
      //Trigger the LoadingState()
      emit(LoadingState());
      places = await data.getInfo();
      //Trigger the LoadedState()
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    //Emit (or Trigger) the DetailState and save the data information to the state
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
