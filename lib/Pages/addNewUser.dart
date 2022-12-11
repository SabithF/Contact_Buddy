// ignore_for_file: prefer_const_constructors

import 'package:contact_app/Services/services.dart';
import 'package:contact_app/models/AddUser.dart';
import 'package:flutter/material.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({Key? key}) : super(key: key);

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  // Creating controllers
  var _userFNameCont = TextEditingController();
  var _userSNameCont = TextEditingController();
  var _userCnumberCont = TextEditingController();
  var _userEmailCont = TextEditingController();

  // validation
  // bool _validateFName = false;
  bool _validateFN = false;
  bool _validateLN = false;
  bool _validateCN = false;

  var _userServices = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create contact"),
      ),
      body: SingleChildScrollView(
          // creating the form
          child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // to get the colum datas to left axis
          crossAxisAlignment: CrossAxisAlignment.start,

          // ignore: duplicate_ignore
          children: [
            // header
            const Text(
              'Add new contact',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500),
            ),

            // to add padding btwn

            // ignore: prefer_const_constructors
            const SizedBox(
              height: 10.0,
            ),
            // Input fields
            SizedBox(
              // width: 100.0,
              child: TextField(
                style: TextStyle(
                    fontSize: 10.0,
                    height: 1.0,
                    color: Color.fromARGB(255, 243, 8, 8)),
                controller: _userFNameCont,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'First Name',
                    labelText: 'First Name',
                    errorText: _validateFN ? 'Please input details' : null),
              ),
            ),
            // Second name

            SizedBox(
              height: 10.0,
            ),
            // Input fields
            SizedBox(
              // width: 100.0,
              child: TextField(
                style: TextStyle(
                    fontSize: 10.0,
                    height: 1.0,
                    color: Color.fromARGB(255, 243, 8, 8)),
                controller: _userSNameCont,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                    errorText: _validateLN ? 'Please input details' : null),
              ),
            ),
            // Contact Number
            SizedBox(
              height: 10.0,
            ),
            // Input fields
            SizedBox(
              // width: 100.0,
              child: TextField(
                style: TextStyle(
                    fontSize: 10.0,
                    height: 1.0,
                    color: Color.fromARGB(255, 243, 8, 8)),
                controller: _userCnumberCont,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Contact Number',
                    labelText: 'Contact Number',
                    errorText: _validateCN ? 'Please input details' : null),
              ),
            ),
            // Creating action button
            const SizedBox(
              height: 20.0,
            ),
            // Save Button
            SizedBox(
                width: double.infinity,
                height: 30,
                child:

                    // Row(
                    //   children: [
                    TextButton(
                        style: TextButton.styleFrom(

                            // use foregroundColor insted of primary
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green[900],
                            textStyle: const TextStyle(fontSize: 15)),
                        onPressed: () async {
                          // validatin if the text feilds are empty
                          setState(() {
                            _userFNameCont.text.isEmpty
                                ? _validateFN = true
                                : _validateFN = false;
                            _userSNameCont.text.isEmpty
                                ? _validateLN = true
                                : _validateLN = false;
                            _userCnumberCont.text.isEmpty
                                ? _validateCN = true
                                : _validateCN = false;
                          });
                          // storing the data into DB when the user has filled all the data
                          if (_validateFN == false &&
                              _validateLN == false &&
                              _validateCN == false) {
                            // storing the data
                            //creating a object to access the model
                            var _user = User();
                            _user.fname = _userFNameCont.text;
                            _user.lname = _userSNameCont.text;
                            _user.contact = _userCnumberCont.text;
                            var result = await _userServices.SaveUser(_user);
                            // print(result);
                          }
                        },
                        child: const Text('Save'))
                // ],
                ),
            SizedBox(
              height: 5.0,
            ),
            // Clear Button
            SizedBox(
                width: double.infinity,
                height: 30,
                child:

                    // Row(
                    //   children: [
                    TextButton(
                        style: TextButton.styleFrom(

                            // use foregroundColor insted of primary
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromARGB(255, 228, 70, 8),
                            textStyle: const TextStyle(fontSize: 15)),
                        onPressed: () {
                          // to clear data in the field on click of clear button
                          _userFNameCont.text = '';
                          _userSNameCont.text = '';
                          _userCnumberCont.text = '';
                        },
                        child: const Text('Clear'))
                // ],
                )
          ],
        ),
      )),
    );
  }
}
