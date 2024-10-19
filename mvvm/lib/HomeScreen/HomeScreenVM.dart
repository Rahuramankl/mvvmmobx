
import 'package:mvvm/BOs/Todo_List.dart';
import 'package:mvvm/HomeScreen/HomeScreenModel.dart';
import 'package:mvvm/Services/Todo_Service/Todo_Service.dart';

class HomeScreenVM extends HomeScreenModel {

  void increamentCurrentValue () {
    try {
      // setCurrentValue();
      fetchTodoList();
    }catch(error) {
      print(error);
    }
  }

  void fetchTodoList () async{
    try {
      Todo? value = await fetchTodo();
      setTodoResponse(value);
      print(response!.title);

    }catch(error) {
      print(error);
    }
  }

   getMessage (String value) async{
    try {
      addMessage(value);
    }catch(e){
      print(e);
    }
  }

  

}

// MVVM => Model View ViewModel

// View =Request=> ViewModel =Access=> Model =Service Instance=> Service
// Vice Versa