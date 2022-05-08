// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/report_incident.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/screens/sensitization.dart';
import 'package:mobile/screens/sosbutton_screen.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var child;
    var screens;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            backgroundColor: Color.fromRGBO(146, 61, 65, 1),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    border: Border(),
                  ),
                  child: Center(
                    child: Row(children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Miriam Duke',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.house,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('Home',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('My profile',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('Community',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.report,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('Report Incident',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyForm()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('Info',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('Settings',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('ChatBot'),
            backgroundColor: Color.fromRGBO(146, 61, 65, 1),
          ),
          body: Stack(children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Desired Message here...",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.send, color: Colors.white, size: 18),
                      backgroundColor: Color.fromRGBO(146, 61, 65, 1),
                      elevation: 0,
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messageType  == "receiver"?Color.fromARGB(156, 139, 139, 139):Color.fromRGBO(146, 61, 65, 1)),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(messages[index].messageContent, style: 
                            TextStyle(fontSize: 15,
                            color:Colors.white),
                            ),
                          ),
                        )
                  );
                }),
          ]),
          /*Column(children: [
            Container(
              width: 300,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(top:20),
              child: Row(
                
                children: <Widget>[
                  
                  Flexible(
                    child: TextField(
                    decoration: InputDecoration(
                      labelText: "Enter Message Here...",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(146, 61, 65, 1), width: 5),
                      ),
                    ),
                    cursorHeight: 30,
                    style: TextStyle(fontSize: 13),
                  )),
                ],
              ),
            ),
            Column(
              children:[
                Container(
              padding:EdgeInsets.only(left: 345) ,
              child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(146, 61, 65, 1)),
                    
                child: Text(
                  "Send",
                ),
                onPressed: () {},
              ),
            ),
              ]
              
            ),
            
          ]),*/
bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 3,
            onTap: (index) => {
              if (index != currentIndex)
                if (index == 0)
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => screens[index])),
                  },
              if (index == 1)
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Sensitization())),
                },
              if (index == 2)
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyForm())),
                },
                
              if (index == 3){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ChatBotScreen())),
                },

              if(index==4){
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const sosbutton_screen())),
              },
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: "Info",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: "Report",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.gps_fixed),
                label: "Emergency",
              )
            ],
            backgroundColor: Colors.white,
            selectedItemColor: Color.fromRGBO(146, 61, 65, 1),
          ),
        ),
      ),
    );
  }
}


class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello", messageType: "receiver"),
  ChatMessage(messageContent: "Hi, how can I help you?", messageType: "sender"),
  ChatMessage(
      messageContent: "I want to make an assault report",
      messageType: "sender"),
  ChatMessage(messageContent: "Click here to make a report", messageType: "receiver"),
  
];
