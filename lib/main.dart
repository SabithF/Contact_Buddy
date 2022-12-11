import 'package:contact_app/Pages/addNewUser.dart';
import 'package:contact_app/Services/services.dart';
import 'package:flutter/material.dart';

import 'models/AddUser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //remove debug lable
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

// creating a Stateful widget
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // creating a List variable
  late List<User> _contactList = <User>[];

  // accessing user service
  final _userService = UserService();

  // get user detials
  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _contactList = <User>[];

    // Inserting the details into the model
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.fname = user['fname'];
        userModel.lname = user['lname'];
        userModel.contact = user['contact'];

        _contactList.add(userModel);
      });
    });
  }

  // init state used ot load the function when the foam is gets loaded
  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Buddy"),
      ),
      body: ListView.builder(
        itemCount: _contactList.length,
        itemBuilder: ((context, index) {
          // out putin main screen
          return Card(
            child: ListTile(
              title: Text(_contactList[index].fname ?? ''),
            ),
          );
        }),
      ),

      // creating a floating action button
      floatingActionButton: FloatingActionButton(
        // pressing event
        onPressed: () {
          // navigating to the create user screen
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNewUser()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
