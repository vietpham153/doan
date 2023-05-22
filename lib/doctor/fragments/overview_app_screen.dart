import 'package:flutter/material.dart';

import 'body_overview_screen.dart';


class OverViewAppScreenD extends StatelessWidget {
  const OverViewAppScreenD({super.key});

  Widget buildBodyDrawerD(IconData icon, String title) {
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
              height: 230,
              padding: EdgeInsets.only(top: 50),
              color: Theme.of(context).accentColor,
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
                    height: 7,
                  ),
                  Text(
                    'Nguyễn Văn Toàn',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            buildBodyDrawerD(Icons.account_circle, 'Hồ sơ cá nhân'),
            const Divider(),
            buildBodyDrawerD(Icons.settings_outlined, 'Cài đặt'),
            const Divider(),
            buildBodyDrawerD(Icons.delete_outline, 'Xóa tài khoản'),
            const Divider(),
            buildBodyDrawerD(Icons.logout_outlined, 'Đăng xuất'),
          ],
        ),
      ),
      body: BodyOverviewScreenD(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Lịch khám'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Thông báo'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Cài đặt'),
          ]),
    );
  }
}
