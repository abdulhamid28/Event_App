
import 'package:internet_folks/Exports/ExportFile.dart';

class CustomBloc extends Bloc {
  CustomBloc(super.initialState);
  final stateController = StreamController<List<Event>>.broadcast();


 void dispose(){
    stateController.close(); //to avoid leakage
 }

}

CustomBloc  myBlocState = CustomBloc(0);