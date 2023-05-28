import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/fragments/dat_lich_screen.dart';
import 'package:get/get.dart';

import '../userPreferences/current_user.dart';



class BodyOverviewScreen extends StatefulWidget {
 const BodyOverviewScreen({super.key});

  @override
  State<BodyOverviewScreen> createState() => _BodyOverviewScreenState();
  
}

class _BodyOverviewScreenState extends State<BodyOverviewScreen> {
  final CurrentUser _currentUser = Get.put(CurrentUser());
//test
  Widget getData( String userData){
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Color.fromARGB(60, 199, 198, 198),
        
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 5,
      ),
      child: Row(
        children: [
          
        const SizedBox(width: 16,),
        Text(
          userData,
          style: const TextStyle(
            fontSize: 15,
          ) ,
          ),
          const Icon(
              Icons.waving_hand_sharp,
              color: Colors.yellow,
          ),
        ],
      ),
    );
  }
//test
  Widget buildServiceGridview(BuildContext context, String title, IconData icon,
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
                      getData( _currentUser.user.userName),
                      Row(
                        children: const [
                          
                          // Text(
                          //   'Phạm Hòn Việt  ',
                          //   style: TextStyle(
                          //       fontSize: 20, fontWeight: FontWeight.bold),
                          // ),
                          // Icon(
                          //   Icons.waving_hand_sharp,
                          //   color: Colors.yellow,
                          // ),
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
                buildServiceGridview(
                    context, 'Đặt lịch', Icons.medical_services_outlined, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DatLichScreen()));
                }),
                buildServiceGridview(context, 'Lịch sử khám', Icons.event, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DatLichScreen()));
                }),
                buildServiceGridview(
                    context, 'Thuốc', Icons.catching_pokemon_outlined, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DatLichScreen()));
                }),
                buildServiceGridview(
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
