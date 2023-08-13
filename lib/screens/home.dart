import 'package:flutter/material.dart';
import 'package:interview/data/user.dart';
import 'package:interview/data/mock_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchController = TextEditingController();
  List<User> users = [];

  void loadUsers() async {                          
    var loadedData = await allData();
    if (loadedData is List) {
      var loadedUsers = User.fromJsonToList(loadedData);
      setState(() {
        users = loadedUsers;
      });
    } else {
      // Handle the case when allData() doesn't return a valid list
      print("Failed to load users.");
    }
  }

  @override
  void initState() {
    super.initState();
    loadUsers(); // Load users in initState
    searchController.addListener(_filterList);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _filterList() {}

  @override
  Widget build(BuildContext context) {
    var users = User.fromJsonToList(allData());

    _getUserAvatar(url) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final item = users[index];
                return ListTile(
                  title: Text(item.firstName + ' ' + item.lastName), // Use the user's name
                  subtitle: Text(item.role), // Use the user's role
                  leading: _getUserAvatar(item.avatar), // Show the user's avatar
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            var newUser = User(id: "b32ec56c-21bb-4b7b-a3a0-635b8bca1f9d", avatar: null, firstName: "James", lastName: "May", email: "ssaull1c@tripod.com", role: "Developer");
            setState(() {
            users.add(newUser);
          });
        },
        tooltip: 'Add new',
        child: Icon(Icons.add),
      ),
    );
  }
}
