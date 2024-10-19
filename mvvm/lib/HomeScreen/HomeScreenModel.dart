import 'package:mobx/mobx.dart';
import '../BOs/Todo_List.dart';
part 'HomeScreenModel.g.dart';
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;
abstract class _HomeScreenModelBase with Store {
// Create 'currentValue' which stores button click count.
@observable
int currentValue = 0;
@action
void setCurrentValue() {
currentValue += 1 ;
}

@observable
 Todo? response; 

@action
  void setTodoResponse(Todo? value) {
      response = value;
  }

@observable
ObservableList<String> arr = ObservableList<String>();

@action
  void addMessage(String message) {
    arr.add(message);
    print("stored: $arr ");
  }  
}