import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm/BOs/Whatsapp_List.dart';
import 'package:mvvm/WhatsAppDetail/WhatsAppDetailVM.dart';

class WhatsAppDetailPage extends StatefulWidget {
  final ContactInfo? view;

  WhatsAppDetailPage(this.view);

  @override
  _WhatsAppDetailPageState createState() => _WhatsAppDetailPageState();
}

class _WhatsAppDetailPageState extends State<WhatsAppDetailPage> {
  final WhatsAppDetailVM viewModel = WhatsAppDetailVM(); // ViewModel instance
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.view!.profilePic.toString()),
              radius: 15.0,
            ),
            SizedBox(width: 10),
            Text(widget.view!.name.toString()),
          ],
        ),
        backgroundColor: Color(0xFF075E54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.view!.isRead = false;
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: viewModel.sendMessages.length,
                itemBuilder: (context, index) {
                  bool? userMessage = viewModel.sendMessages[index].isUserMessage;
                  return ListTile(
                    title: Align(
                      alignment: userMessage! ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: userMessage ? Colors.green[300] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(viewModel.sendMessages[index].message.toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black87),
                    ),
                    child: TextField(
                      cursorColor: Colors.green,
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Messages',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        prefixIcon: Icon(Icons.emoji_emotions_outlined, color: Colors.black),
                        suffixIcon: Icon(Icons.attach_file_outlined, color: Colors.black),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    viewModel.getMessage(_controller.text); // Use ViewModel action
                    _controller.clear();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.send, color: Colors.white, size: 20),
                    radius: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
