class Messages {
  String? message;
  bool? isUserMessage;

  Messages(this.message, this.isUserMessage);
}

class ContactInfo {
  String name;
  String profilePic;
  bool isRead;

  ContactInfo(this.name, this.profilePic, this.isRead);
}
