// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/screens/report-anon-complete.dart';
import 'package:intl/intl.dart';

class MyAnonForm extends StatefulWidget {
  const MyAnonForm({Key? key}) : super(key: key);

  @override
  State<MyAnonForm> createState() => _MyAnonFormState();
}

class _MyAnonFormState extends State<MyAnonForm> {
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
    HomeScreen(
        //userId: -1,
        ),
    MyAnonForm(),
    HomeScreen(
        //userId: -1,
        ),
    HomeScreen(
        //userId: -1,
        )
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
          appBar: AppBar(
              title: const Text('Report Incident'),
              backgroundColor: Color.fromRGBO(146, 61, 65, 1),
              leading: IconButton(
                // allows left aligned icon
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
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
                      maxLines: 7,
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
                      key: ValueKey('bystanderCheckbox'),
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
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
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

  Future<void> submitIncident(String incidentDetails, String periodOfIncident,
      bool isWhistleBlower, int roleId, BuildContext context) async {
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
        "isReport": false,
        "role": {"roleId": roleId},
        "status": 1
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AnonReportComplete()));
    } else {
      throw Exception('Unsuccessful anonymous form reporting');
    }
  }
}
