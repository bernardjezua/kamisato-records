import 'slambook.dart';
import 'friends.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget{
  // List of friends to be passed to the respective pages
  final List friendsList;

  // Indicates that DrawerWidget must include a friendsList
  const DrawerWidget(this.friendsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 130,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                "Kamisato Records",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Friends"),
            onTap: () {
              Navigator.pushNamed(context, FriendsPage.routename, arguments: friendsList);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Slambook"),
            onTap: () {
              Navigator.pushNamed(context, SlamBookForm.routename, arguments: friendsList);
            },
          ),
        ],
      ),
    );
  }
}