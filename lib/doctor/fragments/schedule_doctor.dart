import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String shift;
  final String image;

  Doctor({required this.name, required this.shift, required this.image});
}

class AppointmentSchedule extends StatefulWidget {
  const AppointmentSchedule({super.key});

  @override
  State<AppointmentSchedule> createState() => _AppointmentScheduleState();
}

class _AppointmentScheduleState extends State<AppointmentSchedule> {
  final List<Doctor> doctorsOnShift = [
    Doctor(
        name: 'Dr. Flex Trương Anh Ngọc',
        shift: 'Morning',
        image: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Hayba',
        shift: 'Morning',
        image: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Vietngok',
        shift: 'Morning',
        image: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Johnson',
        shift: 'Afternoon',
        image: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Huanhoahong',
        shift: 'Afternoon',
        image: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Jack',
        shift: 'Afternoon',
        image: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Lee', shift: 'Evening', image: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Leahuyn',
        shift: 'Evening',
        image: 'assets/images/doctor1.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Appointment Schedule'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 121, 0, 109),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              'Doctor\'s Name: Dr. Flex Trương Anh Ngọc',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Shift: Morning',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Doctors on Shift:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: doctorsOnShift.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(doctorsOnShift[index].name),
                    subtitle: Text(doctorsOnShift[index].shift),
                  ),
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 121, 0, 117),
        label: Text('Check in now!'),
      ),
    );
  }
}
