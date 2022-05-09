// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/screens/chatbot_screen.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/loginpage.dart';
import 'package:mobile/screens/report_incident.dart';
import 'package:mobile/screens/request_complete.dart';
import 'package:mobile/screens/sensitization.dart';
import 'package:mobile/screens/sosbutton_screen.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  List<Widget> screens = [
    HomeScreen(
        //userId: -1,
        ),
    Sensitization(),
    RequestForm(),
    ChatBotScreen(),
    sosbutton_screen()
  ];

  // Index of current screen (reference: bottom navigation bar)
  int currentIndex = 0;

  // Form controllers
  final requestDetailsController = TextEditingController();

  // Check boxes
  bool isMedicalChecked = false;
  bool isMentalChecked = false;
  bool isCommunityChecked = false;

  // Respondent ID
  int respondentId = 0;
  int dropDownIndex = 0;

  List<DropdownMenuItem<int>> communityRoleList = [
    const DropdownMenuItem(
      child: Text('Diane Davis'),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text('Salim Wangabi'),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text('Bridgette Ankasah'),
      value: 1,
    ),
    const DropdownMenuItem(
      child: Text('Evonne Saudu'),
      value: 0,
    )
  ];

  @override
  Widget build(BuildContext context) {
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
                          'Anonymous',
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                  //userId: -1,
                                  )));
                        },
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
                          Icons.person,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('Request Help',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {},
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Sensitization()));
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
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 70.0,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        title: const Text('Log Out',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white)),
                        onTap: () {
                          //Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('Report Incident'),
            backgroundColor: Color.fromRGBO(146, 61, 65, 1),
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(children: [
                          const Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),
                          const Text('Mandatory field'),
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(children: [
                            const Text('Community Member Role'),
                            const Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            )
                          ])),
                    ),
                    DropdownButtonFormField(
                      onChanged: (value) {
                        setState(() {
                          dropDownIndex = value as int;
                        });
                      },
                      items: communityRoleList,
                      hint: const Text('Select your preferred respondent'),
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      )),
                    ),
                    CheckboxListTile(
                      activeColor: Color.fromRGBO(146, 61, 65, 1),
                      contentPadding: EdgeInsets.zero,
                      value: isMedicalChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isMedicalChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        'Medical',
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: Color.fromRGBO(146, 61, 65, 1),
                      contentPadding: EdgeInsets.zero,
                      value: isMentalChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isMentalChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        'Mental',
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: Color.fromRGBO(146, 61, 65, 1),
                      contentPadding: EdgeInsets.zero,
                      value: isCommunityChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isCommunityChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        'Community',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: const Text('Additional Concerns')),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        //labelText: 'Incident Details*',
                        hintText:
                            'Insert incident details: current symptoms, preferred method of communication',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      maxLines: 10,
                      controller: requestDetailsController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: const Text(
                              'NOTE: Requests will not be made anonymously')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List requests = [];
                        String completeRequest = "";
                        if (isMedicalChecked) {
                          requests.add("Medical");
                        }
                        if (isMentalChecked) {
                          requests.add("Mental");
                        }
                        if (isCommunityChecked) {
                          requests.add("Community");
                        }

                        if (requestDetailsController.text != "") {
                          requests.add(requestDetailsController.text);
                        }

                        // Create complete request
                        completeRequest = requests.join("; ");

                        // Get respondent ID
                        setRespondentId();

                        // Submit request to server
                        submitRequest(
                            completeRequest, respondentId, 40, context);
                      },
                      child: const Text('Submit'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(146, 61, 65, 1)),
                          fixedSize: MaterialStateProperty.resolveWith(
                              (states) => Size(275.0, 10.0))),
                    ),
                    SizedBox(
                      height: 10,
                    )
                    // Add TextFormFields and ElevatedButton here.
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => {
              if (index != currentIndex)
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => screens[index]))
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

  void setRespondentId() {
    switch (dropDownIndex) {
      // Evonne Saudu
      case 0:
        respondentId = 56;
        break;
      // Bridgette Ankasah
      case 1:
        respondentId = 16;
        break;
      // Salim Wangabi
      case 2:
        respondentId = 17;
        break;
      // Diane Davis
      case 3:
        respondentId = 57;
        break;
      default:
        respondentId = 5;
        break;
    }
  }

  Future<void> submitRequest(String requestedServices, int respondentId,
      int userId, BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8081/request'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'requestedServices': requestedServices,
        'respondent': {"respondent_ID": respondentId},
        'user': {"userId": userId}
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HelpRequestComplete()));
    } else {
      throw Exception('Unsuccessful anonymous form reporting');
    }
  }
}
