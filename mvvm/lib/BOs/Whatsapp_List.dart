import 'package:mvvm/HelperClass/SafeManager.dart';

class ContactInfo {
  final int? id;
  final String? name;
  final String? profilePic;
  final String? time;
  final int? messageUnreadCount;
  final String? lastMessage;
   bool? isRead;
   bool? isGroup;

  ContactInfo({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.time,
    required this.messageUnreadCount,
    required this.lastMessage,
    required this.isRead,
    required this.isGroup,
  });

  // Constructor for creating an instance from a JSON object
  ContactInfo.fromJson(Map<String, dynamic> json)
      : id = SafeManager.parseInt(json, 'id'),
        name = SafeManager.parseString(json, 'name'),
        profilePic = SafeManager.parseString(json, 'profilePic'),
        time = SafeManager.parseString(json, 'time'),
        messageUnreadCount = SafeManager.parseInt(json, 'messageUnreadCount'),
        lastMessage = SafeManager.parseString(json, 'lastMessage'),
        isRead = SafeManager.parseBool(json, 'isRead'),
        isGroup = SafeManager.parseBool(json, 'isGroup');

  // Method to convert the instance back into a JSON object
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profilePic': profilePic,
    'time': time,
    'messageUnreadCount': messageUnreadCount,
    'lastMessage': lastMessage,
    'isRead': isRead,
    'isGroup': isGroup,
  };
}

