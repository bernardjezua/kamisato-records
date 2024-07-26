import 'package:kamisato/slambook.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  // List of friends to be displayed, specified to avoid type Null error
  final List<Map<String, List<String>>> friendsList;
  const FriendsPage(this.friendsList, {super.key}); // Indicates that FriendsPage must include a friendsList

  // Route name of the page, "/" because it's the home page 
  static const routename = "/";

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(widget.friendsList),
      appBar: AppBar(
        title: const Text("Friends List"),
      ),
      body: Center(
        child: widget.friendsList.isEmpty
            ? Column( // Shows if friendsList is empty
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.group, size: 40, color: Colors.amber[700]),
                  const Text("No friends added yet."),
                  const SizedBox(height: 10),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      onPressed: () async {
                        Navigator.pushNamed(context, SlamBookForm.routename, arguments: widget.friendsList);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add Friend"),
                    ),
                  ),
                ],
              )
            : Column( // Shows if friendsList is not empty
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Icon(Icons.people, size: 40, color: Colors.amber[700]),
                      Text(
                        "Total Friends: ${widget.friendsList.length}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          onPressed: () async {
                            Navigator.pushNamed(context, SlamBookForm.routename, arguments: widget.friendsList);
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add Friend"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.friendsList.length,
                    itemBuilder: (context, index) {
                      final friend = widget.friendsList[index];
                      final title = friend.keys.first;
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          trailing: SizedBox(
                            height: 40,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FriendSummary(friend)));
                              },
                              icon: const Icon(Icons.notes),
                              label: const Text("View"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
      ),
    );
  }
}

// Page that displays the summary on an instance of a friend in friendList
class FriendSummary extends StatelessWidget {
  // Friend's summary data to be displayed (elements of the list)
  final Map<String, List<String>> friend;
  const FriendSummary(this.friend, {super.key});

  @override
  Widget build(BuildContext context) {
    final title = friend.keys.first; // Gets the submitted name of the friend, treated as a unique key
    final details = friend[title]; // Gets the list of details of the friend
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
          child: SizedBox(
            width: 350,
            child: 
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
            child: Column(
              children: [
                Center(child: Icon(Icons.book_rounded, size: 40, color: Colors.amber[700])),
                const Center(
                  child: Text(
                    "Summary",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(color: Colors.blue),
                Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    children: [
                      const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(details?[0] ?? "N/A"), // Required to have another value if null
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text("Nickname", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(details?[1] ?? "N/A"),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text("Age", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(details?[2] ?? "N/A"),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text("Relationship", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text((details?[3] == "true") ? "Single" : "Taken"),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text("Happiness", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(details?[4] ?? "N/A"),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text("Vision", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(details?[5] ?? "N/A"),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text("Motto", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(details?[6] ?? "N/A", textAlign: TextAlign.justify),
                  ],
                  ),
                ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back"),
              ),
            ),
        ])
      )))])
    );
  }
}