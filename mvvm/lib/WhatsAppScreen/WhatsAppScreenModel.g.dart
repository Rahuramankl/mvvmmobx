// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WhatsAppScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WhatsAppScreenModel on _WhatsAppScreenModelBase, Store {
  late final _$contactInFoAtom =
      Atom(name: '_WhatsAppScreenModelBase.contactInFo', context: context);

  @override
  ObservableList<ContactInfo> get contactInFo {
    _$contactInFoAtom.reportRead();
    return super.contactInFo;
  }

  @override
  set contactInFo(ObservableList<ContactInfo> value) {
    _$contactInFoAtom.reportWrite(value, super.contactInFo, () {
      super.contactInFo = value;
    });
  }

  late final _$_WhatsAppScreenModelBaseActionController =
      ActionController(name: '_WhatsAppScreenModelBase', context: context);

  @override
  void setValue(ObservableList<ContactInfo> value) {
    final _$actionInfo = _$_WhatsAppScreenModelBaseActionController.startAction(
        name: '_WhatsAppScreenModelBase.setValue');
    try {
      return super.setValue(value);
    } finally {
      _$_WhatsAppScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contactInFo: ${contactInFo}
    ''';
  }
}
