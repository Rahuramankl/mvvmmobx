
import 'package:mvvm/WhatsAppDetail/WhatsAppDetailModel.dart';
class WhatsAppDetailVM extends WhatsAppScreenDetailModel {

void getMessage(String message) {
  try {
    sendMessage(message);
  }catch(e){
    print(e);
  }
}

}              