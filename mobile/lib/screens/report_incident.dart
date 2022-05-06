// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  int currentIndex = 0;
  DateTime selectedDate = DateTime.now();
  bool isBystanderChecked = false;
  bool isReportChecked = false;

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
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                        onTap: () {},
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
                      maxLines: 10,
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
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 2,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
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
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}
