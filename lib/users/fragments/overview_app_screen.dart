import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/fragments/favorite_fragment_screen.dart';
import 'package:flutter_application_1/users/fragments/order_fragment_screen.dart';
import 'package:flutter_application_1/users/fragments/profile_fragment_screen.dart';
import 'package:flutter_application_1/users/fragments/setting_fragments_screen.dart';
import 'package:flutter_application_1/users/quanlydangnhap/login_screen.dart';

import 'package:flutter_application_1/users/userPreferences/current_user.dart';
import 'package:flutter_application_1/users/userPreferences/user_preferences.dart';
import 'package:get/get.dart';
import 'body_overview_screen.dart';
import 'home_fragment_screen.dart';


class OverViewAppScreen extends StatelessWidget {

   
  final CurrentUser _currentUser = Get.put(CurrentUser());
final CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

final List<Widget> _fragmentScreens = [
    BodyOverviewScreen(),
    Favoritesfragmentsscreen(),//lichkham
    OrderFragmentScreen(),//thong bao
    Profilefragmentsscreen(),//cai dat
];

final List _navigationButtonProperties = [
        {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Trang chu",
        },
        {
      "active_icon": Icons.calendar_today,
      "non_active_icon": Icons.calendar_today_outlined,
      "label": "Lich kham",
        },
        {
      "active_icon": Icons.notifications,
      "non_active_icon": Icons.notifications_outlined,
      "label": "Thong bao",
        },
        {
      "active_icon": Icons.settings,
      "non_active_icon": Icons.settings_outlined,
      "label": "Cai dat",
        },
];
final RxInt _indexNumber = 0.obs;
// Widget buid(BuildContext context){
//   return GetBuilder(
//     init: CurrentUser(),
//     initState: (currentState)
//     {
//       _rememberCurrentUser.getUserInfo();
//     }, builder: (CurrentUser controller) {  
//       return Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Obx(
//             () => _fragmentScreens [_indexNumber.value]
//             ),
//           ),
//         bottomNavigationBar: Obx(
//           () =>BottomNavigationBar(
//             currentIndex: _indexNumber.value,
//             onTap: (value){
//               _indexNumber.value = value;
//             },
//             showSelectedLabels: true,
//             showUnselectedLabels: true,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white24,
//             items: List.generate(4, (index) {
//             var navBtnProperty =  _navigationButtonProperties[index];
//             return BottomNavigationBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(navBtnProperty["non_active_icon"]),
//               activeIcon: Icon(navBtnProperty["active_icon"]),
//               label: navBtnProperty["label"]
//             );
//             }),
//           ) 
//           ),
//       );
//     },
//   );
// }
  signOutUser() async{
    var resultRespone = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text(
          "LogOut",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        content: const Text(
          "Are you want to logout from app ?"
        ),
        actions: [
          TextButton(onPressed: (){
          Get.back();
        },
         child: const Text(
          "No",
          style: TextStyle(
            color: Colors.black,
          ),
         )
         ),
         TextButton(onPressed: (){
          Get.back(result: "LoggedOut");
        },
         child: const Text(
          "Yes",
          style: TextStyle(
            color: Colors.black,
          ),
         ))],
         
      )
    );
    if(resultRespone == "LoggedOut"){
      // remove the userdata from phone local storage
      RememberUserPrefs.removeUserInfo().then((value){
        Get.off(LoginScreen());
      });
    }
  }

  Widget getData( String userData){
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
       color: Color.fromARGB(60, 199, 198, 198),
        
      ),
      
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        children: [
          
        Text(
          userData,
          style: const TextStyle(
            fontSize: 15,
          ) ,
          ),
        ],
      ),
    );
  }

  Widget buildBodyDrawer(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
    init: CurrentUser(),
    initState: (currentState)
    {
      _rememberCurrentUser.getUserInfo();
    }, builder: (CurrentUser controller) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trang chủ'),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        // ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.only(top: 50),
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                children: const [
                
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://i-vnexpress.vnecdn.net/2022/05/22/AnhNgocapng-1653235218.png'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14.0,
                          child: Icon(
                            Icons.camera_alt,
                            size: 17.0,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                    ),
                    
                  ),
                  
                  SizedBox(
                    height: 10,
                  ),
                
                ],
              ),
              
            ),
            getData(_currentUser.user.userName),
                 const SizedBox(
                    height: 10,
                  ),
            getData(_currentUser.user.email),
            const SizedBox(
              height: 40,
            ),
            buildBodyDrawer(Icons.account_circle, 'Hồ sơ cá nhân'),
            const Divider(),
            buildBodyDrawer(Icons.settings_outlined, 'Cài đặt'),
            const Divider(),
            buildBodyDrawer(Icons.delete_outline, 'Xóa tài khoản'),
            const Divider(),
            Align(
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: ()
                  {
                    signOutUser();
                  },
                  borderRadius: BorderRadius.circular(32),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    child:  
                    Text(
                      "Sign Out.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    ),
                ),
              ),
            )
          ],
        ),
      ),

      body: SafeArea(
          child: Obx(
            () => _fragmentScreens [_indexNumber.value]
            ),
          ),


      // body:  BodyOverviewScreen(),
      bottomNavigationBar: Obx(
          () =>BottomNavigationBar(
            currentIndex: _indexNumber.value,
            onTap: (value){
              _indexNumber.value = value;
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white24,
            items: List.generate(4, (index) {
            var navBtnProperty =  _navigationButtonProperties[index];
            return BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(navBtnProperty["non_active_icon"]),
              activeIcon: Icon(navBtnProperty["active_icon"]),
              label: navBtnProperty["label"]
            );
            }),
          ), 
          ),
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.calendar_today), label: 'Lịch khám'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.notifications), label: 'Thông báo'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings), label: 'Cài đặt'
                
      //           ),
      //     ]),
       
    
    );
    },
    );
  }
}
