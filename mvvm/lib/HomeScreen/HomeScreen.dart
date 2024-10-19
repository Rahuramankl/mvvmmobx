import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm/HomeScreen/HomeScreenVM.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeScreenVM vm = HomeScreenVM();
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Observer(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Column(
                  children: [
                    Text(
                      vm.response?.title.toString() ?? "0",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      vm.response?.userId.toString() ?? "0",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    vm.getMessage(_textEditingController.text); // Use a function reference here
                  },
                  child: const Text("Submit"),
                ),
                SizedBox(height: 16),
                Visibility(
                  visible: vm.arr.isNotEmpty, // Moved inside the Observer
                  child: Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: vm.arr.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(vm.arr[index]), // Assuming vm.arr contains strings
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vm.increamentCurrentValue,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
