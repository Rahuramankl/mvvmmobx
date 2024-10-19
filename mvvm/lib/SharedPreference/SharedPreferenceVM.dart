import 'package:mvvm/SharedPreference/SharedPreferenceModel.dart';

class SharedPreferencesVm extends SharedPreferencesModel {

  void getValue(String value) {
  try {
    saveValue(value);
  }catch(e){
    print(e);
  }
  }


}