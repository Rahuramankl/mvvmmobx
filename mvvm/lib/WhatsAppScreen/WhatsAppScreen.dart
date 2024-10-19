import 'package:flutter/material.dart';
import 'package:mvvm/WhatsAppDetail/WhatsAppDetail.dart';
import 'package:mvvm/WhatsAppScreen/WhatsAppScreenVM.dart';

class WhatsappScreen extends StatefulWidget {

  WhatsappScreen({super.key});

  @override
  State<WhatsappScreen> createState() => _WhatsappScreenState();

}

class _WhatsappScreenState extends State<WhatsappScreen> {
  WhatsAppScreenVM vm = WhatsAppScreenVM();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text('Clone Whatsapp'), // Add a title to the AppBar
      ),
      body: ListView.builder(
        itemCount: vm.contactInFo.length,
        itemBuilder: (context,index) {
          var item = vm.contactInFo[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WhatsAppDetailPage(item)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(item.profilePic.toString()),
                        radius: 30.0,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                        children: [
                          Text(item.name.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 6,
                          ),// Make the name bold
                          Text(item.lastMessage.toString()),
                        ],
                      ),
                      Spacer(), // Push the right column to the end
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end, // Align text to the end
                        children: [
                          Text(item.time.toString()),
                          SizedBox(
                            height: 6,
                          ),// Format time
                          Visibility(
                            visible: item.isRead == true,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  item.messageUnreadCount.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white, // Set text color to white for better contrast
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(
              Icons.add,
              color: Colors.green,size: 20, // Set the icon color to black
            ),
        ),
        onPressed: () {
      
        },
      ),
    );
  }
}
