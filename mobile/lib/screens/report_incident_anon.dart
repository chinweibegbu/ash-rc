// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile/screens/home_screen.dart';

class MyAnonForm extends StatefulWidget {
  const MyAnonForm({Key? key}) : super(key: key);

  @override
  State<MyAnonForm> createState() => _MyAnonFormState();
}

class _MyAnonFormState extends State<MyAnonForm> {
  // Incident form default date
  DateTime selectedDate = DateTime.now();

  // Incident form check boxes
  bool isBystanderChecked = false;
  bool isReportChecked = false;

  List<Widget> screens = [
    HomeScreen(
      userId: -1,
    ),
    HomeScreen(
      userId: -1,
    ),
    MyAnonForm(),
    HomeScreen(
      userId: -1,
    ),
    HomeScreen(
      userId: -1,
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
                      onChanged: (value) {},
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
                      onPressed: () {},
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
}
