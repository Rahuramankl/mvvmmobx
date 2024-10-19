import 'package:mobx/mobx.dart';
import 'package:mvvm/BOs/Whatsapp_List.dart';
part 'WhatsAppScreenModel.g.dart';

class WhatsAppScreenModel = _WhatsAppScreenModelBase with _$WhatsAppScreenModel;

abstract class _WhatsAppScreenModelBase with Store {
  @observable
  ObservableList<ContactInfo> contactInFo = ObservableList<ContactInfo>();

  @action
  void setValue(ObservableList<ContactInfo> value) {
    contactInFo = value;
  }
}
