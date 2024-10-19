// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$currentValueAtom =
      Atom(name: '_HomeScreenModelBase.currentValue', context: context);

  @override
  int get currentValue {
    _$currentValueAtom.reportRead();
    return super.currentValue;
  }

  @override
  set currentValue(int value) {
    _$currentValueAtom.reportWrite(value, super.currentValue, () {
      super.currentValue = value;
    });
  }

  late final _$responseAtom =
      Atom(name: '_HomeScreenModelBase.response', context: context);

  @override
  Todo? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(Todo? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$arrAtom =
      Atom(name: '_HomeScreenModelBase.arr', context: context);

  @override
  ObservableList<String> get arr {
    _$arrAtom.reportRead();
    return super.arr;
  }

  @override
  set arr(ObservableList<String> value) {
    _$arrAtom.reportWrite(value, super.arr, () {
      super.arr = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void setCurrentValue() {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setCurrentValue');
    try {
      return super.setCurrentValue();
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTodoResponse(Todo? value) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setTodoResponse');
    try {
      return super.setTodoResponse(value);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessage(String message) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.addMessage');
    try {
      return super.addMessage(message);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentValue: ${currentValue},
response: ${response},
arr: ${arr}
    ''';
  }
}
