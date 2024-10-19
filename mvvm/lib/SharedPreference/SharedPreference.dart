
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm/SharedPreference/SharedPreferenceVM.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  @override
  _SharedPreferenceState createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  SharedPreferencesVm viewmodel = SharedPreferencesVm();
  TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    viewmodel.loadSavedValue();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Storage Example'),
      ),
      body: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: 'Enter some text'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    viewmodel.getValue(_controller.text);
                  },
                  child: Text('Save to Local Storage'),
                ),
                SizedBox(height: 20),
                Text('Saved value: $viewmodel.savevalue'),
              ],
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewmodel.loadSavedValue,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
