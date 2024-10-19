import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Notification {
  final String title;
  final DateTime date;

  Notification({required this.title, required this.date});
}

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Notification> currentDateNotifications = [];
  bool isLoading = false; // Start with no loading
  Duration fetchTime = Duration.zero; // To store the time taken for fetch

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange); // Listen to tab changes
  }

  void _handleTabChange() {
    // Check if the current tab is the first one (index 0)
    if (_tabController.index == 0 && !_tabController.indexIsChanging) {
      fetchNotificationsWithTiming(); // Trigger new API call with timing
    }
  }

  // Utility function to measure execution time
  Future<Duration> measureExecutionTime(Future<void> Function() asyncFunction) async {
    DateTime startTime = DateTime.now();  // Record the start time
    await asyncFunction();  // Execute the function passed as a parameter
    DateTime endTime = DateTime.now();    // Record the end time
    return endTime.difference(startTime);  // Return the time difference
  }

  // Modified fetch function to include timing
  Future<void> fetchNotificationsWithTiming() async {
    Duration executionTime = await measureExecutionTime(() => fetchNotifications());

    setState(() {
      fetchTime = executionTime; // Store the fetch time in the state to display in the UI
    });

    print('Fetch notifications time: ${executionTime.inMilliseconds} ms');
  }

  // Simulate an API call
  Future<List<Notification>> fetchNotificationsFromAPI() async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    List<Notification> notifications = List.generate(20, (index) {
      // Randomly generate a date within the past 5 days
      DateTime randomDate =
          DateTime.now().subtract(Duration(days: Random().nextInt(5)));
      return Notification(
        title: 'Notification ${index + 1}',
        date: randomDate,
      );
    });

    return notifications;
  }

  Future<void> fetchNotifications() async {
    setState(() {
      isLoading = true; // Show loader
    });

    List<Future<List<Notification>>> apiCalls = [
      fetchNotificationsFromAPI(),
      fetchNotificationsFromAPI(),
    ];

    List<Notification> allNotifications = [];

    for (var future in apiCalls) {
      allNotifications.addAll(await future);
    }

    // Filter notifications based on the current date
    DateTime today = DateTime.now();
    List<Notification> filteredNotifications = allNotifications
        .where((notification) =>
            notification.date.year == today.year &&
            notification.date.month == today.month &&
            notification.date.day == today.day)
        .toList();

    // Check if we have 10 notifications, if not fetch more
    while (filteredNotifications.length < 10) {
      List<Notification> newNotifications = await fetchNotificationsFromAPI();
      filteredNotifications.addAll(newNotifications.where((notification) =>
          notification.date.year == today.year &&
          notification.date.month == today.month &&
          notification.date.day == today.day));
    }

    // Limit to exactly 10 notifications
    filteredNotifications = filteredNotifications.take(10).toList();

    setState(() {
      currentDateNotifications = filteredNotifications;
      isLoading = false; // Stop loader
    });
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
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Display the fetch time
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fetch Time: ${fetchTime.inMilliseconds} ms',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: currentDateNotifications.length,
                        itemBuilder: (context, index) {
                          Notification notification = currentDateNotifications[index];
                          return ListTile(
                            title: Text(notification.title),
                            subtitle: Text(
                                'Date: ${notification.date.day}-${notification.date.month}-${notification.date.year}'),
                          );
                        },
                      ),
                    ),
                  ],
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

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
  ));
}
