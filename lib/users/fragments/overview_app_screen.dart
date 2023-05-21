import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/quanlydangnhap/login_screen.dart';

import 'package:flutter_application_1/users/userPreferences/current_user.dart';
import 'package:flutter_application_1/users/userPreferences/user_preferences.dart';
import 'package:get/get.dart';
import 'body_overview_screen.dart';


class OverViewAppScreen extends StatefulWidget {



  @override
  State<OverViewAppScreen> createState() => _OverViewAppScreenState();
}

class _OverViewAppScreenState extends State<OverViewAppScreen> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

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

  Widget getData(IconData iconData, String userData){
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
       color: Colors.grey,
        
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
        const SizedBox(width: 16,),
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
              height: 310,
              padding: const EdgeInsets.only(top: 50),
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                children: [
                
                  const Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://scontent.fsgn14-1.fna.fbcdn.net/v/t1.15752-9/324220059_3476629519237918_5671512060780998457_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=ae9488&_nc_ohc=wDy5UrBnrPAAX8Jw8bJ&_nc_ht=scontent.fsgn14-1.fna&oh=03_AdRyouDMW2yAfbeRhH2r1rXxbrjvMNHmExCS01OA3_cwng&oe=64811BEB'),
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




                  
                 const SizedBox(
                    height: 10,
                  ),
                getData(Icons.person, _currentUser.user.userName),
                const SizedBox(
                    height: 10,
                  ),
                getData(Icons.email, _currentUser.user.email),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            buildBodyDrawer(Icons.account_circle, 'Hồ sơ cá nhân'),
            const Divider(),
            buildBodyDrawer(Icons.settings_outlined, 'Cài đặt'),
            const Divider(),
            buildBodyDrawer(Icons.delete_outline, 'Xóa tài khoản'),
            const Divider(),
            Center(
              child: Material(
                color: Colors.red,
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
                    child: Text(
                      "Sign Out.",
                      style: TextStyle(
                        color: Colors.white,
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
      body:  BodyOverviewScreen(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Lịch khám'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Thông báo'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Cài đặt'
                
                ),
          ]),
    );
  }
}
