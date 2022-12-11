import 'package:contact_app/models/AddUser.dart';
import 'package:flutter/material.dart';

class ViewContact extends StatefulWidget {
  final User user;

  const ViewContact({Key? key, required this.user}) : super(key: key);

  @override
  State<ViewContact> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact Buddy"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Detials",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Name',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(widget.user.fname ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Contact',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(widget.user.contact ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Description',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.user.contact ?? '',
                      style: const TextStyle(fontSize: 16)),
                ],
              )
            ],
          ),
        ));
  }
}
