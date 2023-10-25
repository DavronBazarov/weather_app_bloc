import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(tempUnits:TempUnits.celsius));

void toggleTemperature(){
  if(state .tempUnits == TempUnits.celsius){
    emit(const SettingsState(tempUnits: TempUnits.fahrenheit));
  }else{
    emit(const SettingsState(tempUnits: TempUnits.celsius));
  }
}
}
