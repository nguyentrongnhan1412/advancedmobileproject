import 'package:flutter/material.dart';
import 'package:lettutor/src/constants/routes.dart';

class AppEndDrawer extends StatefulWidget {
  const AppEndDrawer({Key? key}) : super(key: key);
  @override
  State<AppEndDrawer> createState() => _AppEndDrawerState();
}

class _AppEndDrawerState extends State<AppEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:
        [

          ListTile(
            leading: const Icon(Icons.person, color: Colors.pink),
            title: const Text('ntnhan7491'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.add_card, color: Colors.pink),
            title: const Text('Buy Lessons'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.key, color: Colors.pink),
            title: const Text('Change Password'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.personal_video, color: Colors.pink),
            title: const Text('Tutor'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.pink),
            title: const Text('Schedule'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.history, color: Colors.pink),
            title: const Text('History'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.book, color: Colors.pink),
            title: const Text('Courses'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.menu_book, color: Colors.pink),
            title: const Text('My Course'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.laptop, color: Colors.pink),
            title: const Text('Become A Tutor'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.pink),
            title: const Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}