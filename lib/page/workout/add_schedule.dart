// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../utility/color.dart';
// import '../widgets/button.dart';
// import '../widgets/input_field.dart';
//
//
// class AddSchedule extends StatefulWidget {
//   const AddSchedule({Key? key}) : super(key: key);
//
//   @override
//   State<AddSchedule> createState() => _AddScheduleState();
// }
//
// class _AddScheduleState extends State<AddSchedule> {
//   CollectionReference workout = FirebaseFirestore.instance.collection('workout');
//   String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   User? user = FirebaseAuth.instance.currentUser;
//
//   DateTime _selectedDate = DateTime.now();
//   String _time = DateFormat("hh:mm a").format(DateTime.now()).toString();
//   int _selectedRemind = 5;
//   List<int> remindList = [
//     10,
//     15,
//     20,
//     30,
//   ];
//
//   String _selectedRepeat = "None";
//   List<String> repeatList = [
//     "None",
//     "Daily",
//     "Weekly",
//     "Monthly",
//   ];
//
//   String _chooseWorkout = "Fullbody workout";
//   List<String> chooseWorkoutList = [
//     "Fullbody workout",
//     "Lowerbody workout",
//     "AB workout",
//   ];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 375;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _appBar(context),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               MyInputField(
//                 title: "Date",
//                 hint: DateFormat.yMd().format(_selectedDate),
//                 widget: IconButton(
//                   icon: const Icon(
//                     Icons.calendar_today_outlined,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     _getDateFromUser();
//                   },
//                 ),
//               ),
//               MyInputField(
//                 title: "Time",
//                 hint: _time,
//                 widget: IconButton(
//                   icon: const Icon(
//                     Icons.access_time_rounded,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     _getTimeFromUser(isStartTime: true);
//                   },
//                 ),
//               ),
//               MyInputField(
//                 title: "Choose workout",
//                 hint: _chooseWorkout,
//                 widget: DropdownButton(
//                   icon: const Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.grey,
//                   ),
//                   iconSize: 32,
//                   elevation: 4,
//                   style: subTitleStyle,
//                   underline: Container(
//                     height: 0,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _chooseWorkout = newValue!;
//                     });
//                   },
//                   items: chooseWorkoutList
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(
//                         value,
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//
//               /*MyInputField(
//                 title: "Remind",
//                 hint: "$_selectedRemind minutes early",
//                 widget: DropdownButton(
//                   icon: const Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.grey,
//                   ),
//                   iconSize: 32,
//                   elevation: 4,
//                   style: subTitleStyle,
//                   underline: Container(
//                     height: 0,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedRemind = int.parse(newValue!);
//                     });
//                   },
//                   items: remindList.map<DropdownMenuItem<String>>((int value) {
//                     return DropdownMenuItem<String>(
//                       value: value.toString(),
//                       child: Text(value.toString()),
//                     );
//                   }).toList(),
//                 ),
//               ),*/
//               /*MyInputField(
//                 title: "Repeat",
//                 hint: _selectedRepeat,
//                 widget: DropdownButton(
//                   icon: const Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.grey,
//                   ),
//                   iconSize: 32,
//                   elevation: 4,
//                   style: subTitleStyle,
//                   underline: Container(
//                     height: 0,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedRepeat = newValue!;
//                     });
//                   },
//                   items:
//                       repeatList.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(
//                         value,
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),*/
//
//               SizedBox(
//                 height: fem * 300,
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: MyButton(
//                     width: 330,
//                     height: 55,
//                     label: "Add Schedule",
//                     onTap: () async {
//                       await workout.doc(user!.uid).collection('schedule').add({
//                         'date': formattedDate,
//                         'time': _time,
//                         'choose': _chooseWorkout,
//                       }).then((value) => print("Added"));
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _appBar(BuildContext context) {
//     return AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Center(
//           child: Text(
//             "Add Schedule",
//             style: GoogleFonts.lato(
//               textStyle: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//           ),
//         ),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//         actions: const [
//           SizedBox(
//             width: 35,
//           ),
//         ]);
//   }
//
//   _getDateFromUser() async {
//     DateTime? _pickerDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2040),
//     );
//
//     if (_pickerDate != null) {
//       setState(() {
//         _selectedDate = _pickerDate;
//       });
//     } else {
//       print("Wrong");
//     }
//   }
//
//   _getTimeFromUser({required bool isStartTime}) async {
//     var pickedTime = await _showTimePicker();
//     String _formatedTime = pickedTime.format(context);
//     if (pickedTime == null) {
//       print("Time cancel");
//     } else if (isStartTime == true) {
//       setState(() {
//         _time = _formatedTime;
//       });
//     }
//   }
//
//   _showTimePicker() async {
//     return await showTimePicker(
//       initialEntryMode: TimePickerEntryMode.input,
//       context: context,
//       initialTime: TimeOfDay(
//         hour: int.parse(_time.split(":")[0]),
//         minute: int.parse(_time.split(":")[1].split(" ")[0]),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utility/color.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  CollectionReference workout =
      FirebaseFirestore.instance.collection('workout');
  User? user = FirebaseAuth.instance.currentUser;

  DateTime _selectedDate = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _time = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [
    10,
    15,
    20,
    30,
  ];

  String _selectedRepeat = "None";
  List<String> repeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];

  String _chooseWorkout = "Fullbody workout";
  List<String> chooseWorkoutList = [
    "Fullbody workout",
    "Lowerbody workout",
    "AB workout",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyInputField(
                title: "Date",
                hint: formattedDate,
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              MyInputField(
                title: "Time",
                hint: _time,
                widget: IconButton(
                  icon: const Icon(
                    Icons.access_time_rounded,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getTimeFromUser(isStartTime: true);
                  },
                ),
              ),
              MyInputField(
                title: "Choose workout",
                hint: _chooseWorkout,
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _chooseWorkout = newValue!;
                    });
                  },
                  items: chooseWorkoutList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  }).toList(),
                ),
              ),

              /*MyInputField(
                title: "Remind",
                hint: "$_selectedRemind minutes early",
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),*/
              /*MyInputField(
                title: "Repeat",
                hint: _selectedRepeat,
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                  items:
                      repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  }).toList(),
                ),
              ),*/

              SizedBox(
                height: fem * 300,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MyButton(
                    width: 330,
                    height: 55,
                    label: "Add Schedule",
                    onTap: () async {
                      await workout.doc(user!.uid).collection('schedule').add({
                        'date': formattedDate,
                        'time': _time,
                        'choose': _chooseWorkout,
                      }).then((value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Successfully Added"),
                          backgroundColor: Colors.green,
                        ));
                      });

                      // await workout.add({
                      //   'date':formattedDate,
                      //   'time':_time,
                      //   'choose':_chooseWorkout,
                      // }).then((value) => print("Added"));
                    }, fontSize: 16,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Add Schedule",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        actions: const [
          SizedBox(
            width: 35,
          ),
        ]);
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2040),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    } else {
      print("Wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time cancel");
    } else if (isStartTime == true) {
      setState(() {
        _time = _formatedTime;
      });
    }
  }

  _showTimePicker() async {
    return await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_time.split(":")[0]),
        minute: int.parse(_time.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
