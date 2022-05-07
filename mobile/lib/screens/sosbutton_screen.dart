// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/screens/report_incident.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile/screens/report_incident.dart';
// import 'package:slide_to_act/slide_to_act.dart';

// // ignore: camel_case_types
// class sosbutton_screen extends StatefulWidget {
//   const sosbutton_screen({Key? key}) : super(key: key);

//   @override
//   State<sosbutton_screen> createState() => _sosbuttonState();
// }

// // ignore: camel_case_types
// class _sosbuttonState extends State<sosbutton_screen> {
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           drawer: Drawer(
//             backgroundColor: Color.fromRGBO(146, 61, 65, 1),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 DrawerHeader(
//                   decoration: BoxDecoration(
//                     border: Border(),
//                   ),
//                   child: Center(
//                     child: Row(children: [
//                       CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/profile.jpg'),
//                         radius: 50.0,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Text(
//                           'Miriam Duke',
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: const Icon(
//                           Icons.house,
//                           color: Colors.white,
//                           size: 24.0,
//                         ),
//                         title: const Text('Home',
//                             style:
//                                 TextStyle(fontSize: 24.0, color: Colors.white)),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         leading: const Icon(
//                           Icons.person,
//                           color: Colors.white,
//                           size: 24.0,
//                         ),
//                         title: const Text('My profile',
//                             style:
//                                 TextStyle(fontSize: 24.0, color: Colors.white)),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         leading: const Icon(
//                           Icons.people,
//                           color: Colors.white,
//                           size: 24.0,
//                         ),
//                         title: const Text('Community',
//                             style:
//                                 TextStyle(fontSize: 24.0, color: Colors.white)),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         leading: const Icon(
//                           Icons.report,
//                           color: Colors.white,
//                           size: 24.0,
//                         ),
//                         title: const Text('Report Incident',
//                             style:
//                                 TextStyle(fontSize: 24.0, color: Colors.white)),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => MyForm()));
//                         },
//                       ),
//                       ListTile(
//                         leading: const Icon(
//                           Icons.info,
//                           color: Colors.white,
//                           size: 24.0,
//                         ),
//                         title: const Text('Info',
//                             style:
//                                 TextStyle(fontSize: 24.0, color: Colors.white)),
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       ListTile(
//                         leading: const Icon(
//                           Icons.settings,
//                           color: Colors.white,
//                           size: 24.0,
//                         ),
//                         title: const Text('Settings',
//                             style:
//                                 TextStyle(fontSize: 24.0, color: Colors.white)),
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           appBar: AppBar(
//             title: const Text('GPS Tracking'),
//             backgroundColor: Color.fromRGBO(146, 61, 65, 1),
//           ),
//           body: Column(children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 100.0),
//             ),
//             Center(
//               child: ElevatedButton(
//                 child: const Text(
//                   "SOS",
//                   style: TextStyle(
//                     fontSize: 40,
//                   ),
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                 ),
                
//                 onPressed: () => {},
//                 onLongPress: () => {},
//                 style: ButtonStyle(
//                   fixedSize: MaterialStateProperty.all(Size.fromRadius(150)),
//                   backgroundColor: MaterialStateProperty.all(
//                       Color.fromARGB(255, 255, 79, 88)),
//                   shape: MaterialStateProperty.all<CircleBorder>(
//                     CircleBorder(
                     
//                       side:BorderSide(color: Color.fromARGB(255, 243, 174, 170),width: 25),
                        
//                       ),
                    
//                   ),
               
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: Text(
//                 "KEEP CALM!",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(child: Text("Help is on the way!")),
//             /*Container(
//               child: ListView(
//           children: <Widget>[
//             Builder(
//               builder: (context) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     innerColor: Colors.black,
//                     outerColor: Colors.white,
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       'Unlock',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     sliderButtonIcon: Icon(Icons.lock),
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     height: 100,
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     sliderButtonIconSize: 48,
//                     sliderButtonYOffset: -20,
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     elevation: 24,
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     borderRadius: 16,
//                     animationDuration: Duration(seconds: 1),
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     reversed: true,
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                     submittedIcon: Icon(
//                       Icons.done_all,
//                       color: Colors.white,
//                     ),
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 final GlobalKey<SlideActionState> _key = GlobalKey();
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     key: _key,
//                     onSubmit: () {
//                       Future.delayed(
//                         Duration(seconds: 1),
//                         //() => _key.currentState.reset(),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             Builder(
//               builder: (context) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SlideAction(
//                     sliderRotate: false,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),*/
//           ]),



//           bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: currentIndex,
//             onTap: (index) => setState(() => currentIndex = index),
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: "Home",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.info),
//                 label: "Info",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.report),
//                 label: "Report",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.chat),
//                 label: "Chat",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.gps_fixed),
//                 label: "Emergency",
//               )
//             ],
//             backgroundColor: Colors.white,
//             selectedItemColor: Color.fromRGBO(146, 61, 65, 1),
//           ),
//         ),
//       ),
//     );
//   }
// }
