import 'dart:math';

import 'package:mobx/mobx.dart';

import '../BOs/Notification.dart';
part 'ParrelScreenModelBase.g.dart';

class ParrelScreenModel = _ParrelScreenModelBase with _$_ParrelScreenModelBase;

abstract class _ParrelScreenModelBase with Store {
  @observable
  ObservableList<Notification> currentDateNotifications = ObservableList<Notification>();

  // Loading state observable
  @observable
  bool isLoading = false;

  // Time taken for fetching notifications
  @observable
  Duration fetchTime = Duration.zero;

  // Simulate an API call
  Future<List<Notification>> fetchNotificationsFromAPI() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate API delay

    List<Notification> notifications = List.generate(20, (index) {
      DateTime randomDate = DateTime.now().subtract(Duration(days: Random().nextInt(5)));
      return Notification(
        title: 'Notification ${index + 1}',
        date: randomDate,
      );
    });

    return notifications;
  }

  // Action to fetch notifications with timing
  @action
  Future<void> fetchNotificationsWithTiming() async {
    Duration executionTime = await measureExecutionTime(() => fetchNotifications());

    fetchTime = executionTime; // Store the fetch time
  }

  // Measure the time taken to perform an action
  Future<Duration> measureExecutionTime(Future<void> Function() asyncFunction) async {
    DateTime startTime = DateTime.now();
    await asyncFunction();
    DateTime endTime = DateTime.now();
    return endTime.difference(startTime);
  }

  // Action to fetch notifications
  @action
  Future<void> fetchNotifications() async {
    isLoading = true;

    List<Future<List<Notification>>> apiCalls = [
      fetchNotificationsFromAPI(),
      fetchNotificationsFromAPI(),
    ];

    List<Notification> allNotifications = [];

    for (var future in apiCalls) {
      allNotifications.addAll(await future);
    }

    DateTime today = DateTime.now();
    List<Notification> filteredNotifications = allNotifications.where((notification) {
      return notification.date.year == today.year &&
          notification.date.month == today.month &&
          notification.date.day == today.day;
    }).toList();

    while (filteredNotifications.length < 10) {
      List<Notification> newNotifications = await fetchNotificationsFromAPI();
      filteredNotifications.addAll(newNotifications.where((notification) {
        return notification.date.year == today.year &&
            notification.date.month == today.month &&
            notification.date.day == today.day;
      }));
    }

    filteredNotifications = filteredNotifications.take(10).toList();

    currentDateNotifications = ObservableList.of(filteredNotifications);
    isLoading = false;
  }
 
}
