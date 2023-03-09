import 'package:equatable/equatable.dart';
import 'package:jappa/model/data_model.dart';

//We create our Cubit states here

abstract class CubitStates extends Equatable {}

//This is the initial state. It is compulsory
class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//We can add several other states here

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//This state will be triggered when the data is loading
class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//This state will be triggered when the data has been loaded successfully
class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  //We update out state with the values
  List<Object?> get props => [places];
}

//This state will be triggered when one of the place item is clicked
class DetailState extends CubitStates {
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  //We update out state with the values
  List<Object?> get props => [place];
}
