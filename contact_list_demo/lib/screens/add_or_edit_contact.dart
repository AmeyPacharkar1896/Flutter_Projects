// ignore_for_file: must_be_immutable
import 'package:contact_list_demo/main.dart';
import 'package:contact_list_demo/screens/contact.dart';
import 'package:flutter/material.dart';

class AddOrEditContact extends StatefulWidget {
  AddOrEditContact({super.key, this.name, this.phoneNumber});

  late String? name, phoneNumber;
  @override
  State<AddOrEditContact> createState() => _AddOrEditContactState();
}

class _AddOrEditContactState extends State<AddOrEditContact> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.name != null) {
      userNameController.text = widget.name!;
      userPhoneNumber.text = widget.phoneNumber!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          (widget.name != null ? 'Update Contact' : 'Add Contact'),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: userNameController,
        decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'Enter name',
        ),
        // keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
      ),
    ),
              Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: userPhoneNumber,
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: 'Enter the phone number',
        ),
        // keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number';
                  }
                  if (value.length != 10) {
                    return 'Phone number should be of 10 digits';
                  }
                  return null;
                },
      ),
    ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FilledButton(
                    onPressed: () {
                      // final isValid = formKey.currentState?.validate();
                      // print(isValid);
                      // late bool checkIsValid;
                      // if(isValid == null) () => checkIsValid = true;
                      // print(checkIsValid);
                      // if(checkIsValid) {
                      Contactammmm contactDetails = Contactammmm(
                        username: userNameController.text,
                        phoneNumber: userPhoneNumber.text,
                      );
                      Navigator.pop(context, contactDetails);
                      },
                    // },
                    child: const Text('Add to contact')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    userPhoneNumber.dispose();
  }
}
