// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/screens/chatbot_screen.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/loginpage.dart';
import 'package:mobile/screens/report-complete.dart';
import 'package:mobile/screens/request_help.dart';
import 'package:mobile/screens/sensitization.dart';
import 'package:mobile/screens/sosbutton_screen.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Index of current screen (reference: bottom navigation bar)
  int currentIndex = 2;

  // Form controllers
  final incidentDetailsController = TextEditingController();

  // Incident form default date
  DateTime selectedDate = DateTime.now();

  // Incident form check boxes
  bool isBystanderChecked = false;
  bool isReportChecked = false;

  // Role ID
  int roleId = 0;
  int dropDownIndex = 0;

  List<Widget> screens = [
    HomeScreen(
        //userId: -1,
        ),
    Sensitization(),
    MyForm(),
    ChatBotScreen(),
    sosbutton_screen()
  ];

  List<DropdownMenuItem<int>> communityRoleList = [
    const DropdownMenuItem(
      child: Text('Staff'),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text('Faculty'),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text('Faculty Intern'),
      value: 1,
    ),
    const DropdownMenuItem(
      child: Text('Student'),
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
                        onTap: () {},
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RequestForm()));
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
                      hint: const Text('Select role'),
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(children: [
                            const Text('Incident Details'),
                            const Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            )
                          ])),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        //labelText: 'Incident Details*',
                        hintText: 'Insert incident details',
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
                      controller: incidentDetailsController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: const Text('Incident Date')),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        side: MaterialStateProperty.resolveWith(
                            (states) => BorderSide(color: Colors.grey)),
                        alignment: Alignment.centerLeft,
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) => Size.fromHeight(40)),
                        //shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide()),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: Color.fromRGBO(146, 61, 65, 1),
                      contentPadding: EdgeInsets.zero,
                      value: isBystanderChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isBystanderChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        'I am a bystander',
                      ),
                    ),
                    if (!isBystanderChecked)
                      CheckboxListTile(
                        activeColor: Color.fromRGBO(146, 61, 65, 1),
                        contentPadding: EdgeInsets.zero,
                        value: isReportChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isReportChecked = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'I would like to file a report',
                        ),
                      ),
                    OutlinedButton.icon(
                      icon: Icon(
                        Icons.attachment,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                      label: const Text(
                        'Upload evidence',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.resolveWith(
                              (states) => BorderSide(color: Colors.grey)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          fixedSize: MaterialStateProperty.resolveWith(
                              (states) => Size(275.0, 10.0))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        DateFormat formatter = DateFormat('yyyy-MM-dd');
                        String periodOfIncident =
                            formatter.format(selectedDate);
                        setRoleId();

                        submitIncident(
                            incidentDetailsController.text,
                            periodOfIncident,
                            isBystanderChecked,
                            isReportChecked,
                            roleId,
                            context);
                      },
                      child: const Text('Submit'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(146, 61, 65, 1)),
                          fixedSize: MaterialStateProperty.resolveWith(
                              (states) => Size(275.0, 10.0))),
                    ),
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

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  void setRoleId() {
    switch (dropDownIndex) {
      case 0:
        roleId = 3;
        break;
      case 1:
        roleId = 4;
        break;
      case 2:
        roleId = 4;
        break;
      case 3:
        roleId = 4;
        break;
      default:
        roleId = 3;
        break;
    }
  }

  Future<void> submitIncident(
      String incidentDetails,
      String periodOfIncident,
      bool isWhistleBlower,
      bool isReport,
      int roleId,
      BuildContext context) async {
    //print(email);
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8081/incident'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "incidentDetails": incidentDetails,
        "periodOfIncident": periodOfIncident,
        "isWhistleBlower": isWhistleBlower,
        "isReport": isReport,
        "role": {"roleId": roleId},
        "status": 1
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ReportComplete()));
    } else {
      throw Exception('Unsuccessful anonymous form reporting');
    }
  }
}
