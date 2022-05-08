// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/screens/chatbot_screen.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/report_incident.dart';
import 'package:mobile/screens/sensitization.dart';
import 'package:slide_to_act/slide_to_act.dart';

// ignore: camel_case_types
class sosbutton_screen extends StatefulWidget {
  const sosbutton_screen({Key? key}) : super(key: key);

  @override
  State<sosbutton_screen> createState() => _sosbuttonState();
}

// ignore: camel_case_types
class _sosbuttonState extends State<sosbutton_screen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            title: const Text('GPS Tracking'),
            backgroundColor: Color.fromRGBO(146, 61, 65, 1),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              child: ElevatedButton(
                child: const Text(
                  "SOS",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                    //barrierDismissible: true,
                    //barrierColor: Colors.red,
                    useSafeArea: true,
                    useRootNavigator: true,
                  ),
                },
                onLongPress: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                    //barrierDismissible: true,
                    //barrierColor: Colors.white,
                    useSafeArea: true,
                    useRootNavigator: true,
                  ),
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromRadius(150)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 79, 88)),
                  shape: MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(
                      side: BorderSide(
                          color: Color.fromARGB(255, 243, 174, 170), width: 25),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "KEEP CALM!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(child: Text("Help is on the way!")),
            Container(
              height: 85,
              child: ListView(
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 5, left: 8, right: 8),
                        child: SlideAction(
                          height: 60,
                          sliderButtonIcon: Icon(
                            Icons.phone,
                            color: Color.fromRGBO(146, 61, 65, 1),
                          ),
                          sliderButtonIconPadding: 9,
                          child: Text(
                            "Slide for emergency call",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          innerColor: Colors.white,
                          outerColor: Colors.grey.shade200,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 4,
            onTap: (index) => {
              if (index != currentIndex)
                if (index == 0)
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => screens[index])),
                  },
              if (index == 1)
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Sensitization())),
                },
              if (index == 2)
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyForm())),
                },
              if (index == 3)
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChatBotScreen())),
                },
              if (index == 4)
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const sosbutton_screen())),
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

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('SOS button pressed!'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Help is on the way!"),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
