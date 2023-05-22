import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/fragments/dat_lich_screen.dart';
import 'package:flutter_application_1/doctor/fragments/schedule_doctor.dart';
import 'package:flutter_application_1/doctor/fragments/schedule_patient.dart';

class BodyOverviewScreenD extends StatelessWidget {
  const BodyOverviewScreenD({super.key});

  Widget buildServiceGridviewD(BuildContext context, String title, IconData icon,
      Function() tapHandler) {
    return InkWell(
      onTap: tapHandler,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.purple,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Chào'),
                      Row(
                        children: const [
                          Text(
                            'Dr. Toàn Nguyễn  ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.waving_hand_sharp,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://i-vnexpress.vnecdn.net/2022/05/22/AnhNgocapng-1653235218.png'),
                    child: Text(''))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                'assets/images/ad_main.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: [
                buildServiceGridviewD(
                    context, 'Đặt lịch', Icons.medical_services_outlined, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DatLichScreen()));
                }),
                buildServiceGridviewD(context, 'Lịch trực khám', Icons.event,
                    () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppointmentSchedule()));
                }),
                buildServiceGridviewD(context, 'Lịch hẹn khám', Icons.schedule,
                    () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppointmentSchedulePage()));
                }),
                buildServiceGridviewD(
                    context, 'Hỗ trợ', Icons.support_agent_outlined, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DatLichScreen()));
                }),
              ]),
        )
      ],
    );
  }
}
