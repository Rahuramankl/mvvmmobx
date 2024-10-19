import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'SharedPreferencesModel.g.dart';

class SharedPreferencesModel= _SharedPreferencesModelBase with _$SharedPreferencesModel;

abstract class _SharedPreferencesModelBase with Store {
  @observable
  String savedValue = 'No value saved';

  @action
   // Load saved value from local storage
  loadSavedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      savedValue = prefs.getString('saved_value') ?? 'No value saved';
    
  }

  @action
  // Save value to local storage
  saveValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_value', value);
  }
  
}
