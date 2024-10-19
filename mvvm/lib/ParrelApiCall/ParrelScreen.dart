// lib/views/parrel_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm/ParrelApiCall/ParrelScreenVM.dart';
import '../BOs/notification.dart';

class ParrelScreen extends StatefulWidget {
  @override
  _ParrelScreenState createState() => _ParrelScreenState();
}

class _ParrelScreenState extends State<ParrelScreen> with SingleTickerProviderStateMixin {
  final ParrelScreenVM vm = ParrelScreenVM();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.index == 0 && !_tabController.indexIsChanging) {
      vm.fetchNotificationsWithTiming();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Current Notifications'),
            Tab(text: 'Other Tab'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Observer(
            builder: (context) {
              if (vm.isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Fetch Time: ${vm.fetchTime.inMilliseconds} ms',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: vm.currentDateNotifications.length,
                  //     itemBuilder: (context, index) {
                  //       Notification notification = vm.currentDateNotifications[index];
                  //       return ListTile(
                  //         title: Text(notification.title),
                  //         subtitle: Text(
                  //           'Date: ${notification.date.day}-${notification.date.month}-${notification.date.year}',
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              );
            },
          ),
          Center(child: Text('Another Tab Content')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }
}
