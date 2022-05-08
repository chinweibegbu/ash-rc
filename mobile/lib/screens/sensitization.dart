// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile/screens/chatbot_screen.dart';
import 'package:mobile/screens/report_incident.dart';
import 'package:mobile/screens/sosbutton_screen.dart';

import 'home_screen.dart';

class Sensitization extends StatefulWidget {
  const Sensitization({Key? key}) : super(key: key);

  @override
  State<Sensitization> createState() => _Sensitization();
}

class _Sensitization extends State<Sensitization> {
  int currentIndex = 1;

  List<Widget> screens = [
    HomeScreen(
        //userId: -1,
        ),
    Sensitization(),
    MyForm(),
    ChatBotScreen(),
    sosbutton_screen()
  ];

  @override
  Widget build(BuildContext context) {
    //var screens;
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
                          // Navigator.pop(context);
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
                        onTap: () {
                          // Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('Sensitization'),
            backgroundColor: Color.fromRGBO(146, 61, 65, 1),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Learn More',
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    'Use the resources on this page to learn more about sexual and physical misconduct. _______________________________________________',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromRGBO(146, 61, 65, 1),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0.0, bottom: 5.0, right: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/Consent_word.png')),
                  ),
                  Text(
                    'Active consent is the ongoing checking in with yourself, your body, your partner and their body during intimate encounters.  _______________________________________________',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromRGBO(146, 61, 65, 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('What consent looks like:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(146, 61, 65, 1),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      'Clear: Verbally given permission to whats about to happen',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      'Coherent: Neither party is incapacitated and is able to make informed decisions free from pressure or coersion ',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      'Reversible: The ability to change your mind anytime during the encounter',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('CONSENT IS NOT:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(146, 61, 65, 1),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      'Assumed: Cannot be implied from silence, passivity, or lack of physical resistance',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      'Automatic: The existence of a current or previous dating, marital or sexual relationship does not constitute consent ',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  //   child: Column(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(bottom: 8.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               border: Border.all(),
                  //               borderRadius: BorderRadius.circular(5.0)),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Row(children: [
                  //               Icon(Icons.file_present, size: 30.0),
                  //               Flexible(
                  //                 child: Text(
                  //                     'Ashesi University sexual harassment and misconduct policies'),
                  //               ),
                  //             ]),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         decoration: BoxDecoration(
                  //             border: Border.all(),
                  //             borderRadius: BorderRadius.circular(5.0)),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Row(children: [
                  //             Icon(Icons.cloud_download, size: 30.0),
                  //             Flexible(
                  //               child: Text(
                  //                   'Annual sexual misconduct surveys (2015 to 2021)'),
                  //             ),
                  //           ]),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15.0),
                  //   child: Text(
                  //     'Respondents',
                  //     style: TextStyle(
                  //         fontSize: 35.0, fontWeight: FontWeight.w600),
                  //   ),
                  // ),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Column(
                  //             children: [
                  //               CircleAvatar(
                  //                 backgroundImage: AssetImage(
                  //                     'assets/images/diane-davis.jpg'),
                  //                 radius: 50.0,
                  //               ),
                  //               Text(
                  //                 'Diane Davis',
                  //                 style: TextStyle(fontWeight: FontWeight.bold),
                  //               ),
                  //               Text('Head, CCAPs')
                  //             ],
                  //           ),
                  //           Column(
                  //             children: [
                  //               CircleAvatar(
                  //                 backgroundImage: AssetImage(
                  //                     'assets/images/millicent-adjei.jpg'),
                  //                 radius: 50.0,
                  //               ),
                  //               Text('Dr Millicent Adjei',
                  //                   style:
                  //                       TextStyle(fontWeight: FontWeight.bold)),
                  //               Text('Head, ODIP')
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         Column(
                  //           children: [
                  //             CircleAvatar(
                  //               backgroundImage: AssetImage(
                  //                   'assets/images/salim-wangabi.jpg'),
                  //               radius: 50.0,
                  //             ),
                  //             Text('Salim Wangabi',
                  //                 style:
                  //                     TextStyle(fontWeight: FontWeight.bold)),
                  //             Text('Consellor, CCAPs')
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             CircleAvatar(
                  //               backgroundImage:
                  //                   AssetImage('assets/images/nurse.jpeg'),
                  //               radius: 50.0,
                  //             ),
                  //             Text('Bridgette Asiedu',
                  //                 style:
                  //                     TextStyle(fontWeight: FontWeight.bold)),
                  //             Text('Nurse, Health Center')
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // )
                ],
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
                activeIcon: Icon(Icons.gps_fixed),
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
