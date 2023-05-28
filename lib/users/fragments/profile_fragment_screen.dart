import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/userPreferences/current_user.dart';
import 'package:get/get.dart';

class Profilefragmentsscreen extends StatelessWidget{
  final CurrentUser _currentUser = Get.put(CurrentUser());
  Widget getData( String userData){
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
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ListView(
          children: [

            Center(
              child: Image.asset(
                "images/man.png",
                width: 240,
                ),
              
            ),
            const SizedBox(height: 20,),
            getData(_currentUser.user.userName),
            const SizedBox(height: 20,),
            getData(_currentUser.user.email),
          ],
        )
        ),
    );
  }
}