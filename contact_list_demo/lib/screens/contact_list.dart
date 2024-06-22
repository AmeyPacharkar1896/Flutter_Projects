import 'package:contact_list_demo/screens/add_or_edit_contact.dart';
import 'package:contact_list_demo/screens/contact.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contactammmm> contactList = [];

  //navigationbar
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Contact List',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      //go ahead on your own risk
      //bottom navigation bar

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.person_add), label: 'Add contact'),
          NavigationDestination(icon: Icon(Icons.recent_actors), label: 'Recent'),
          NavigationDestination(icon: Icon(Icons.contacts), label: 'Contacts'),
        ],
      ),

      body: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            final contactDetail = contactList[index];
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(contactDetail.username),
              subtitle: Text(contactDetail.phoneNumber),
              trailing: IconButton(
                hoverColor: Colors.grey,
                onPressed: () {
                  setState( () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delete contact'),
                            content: const SingleChildScrollView(
                              child: SizedBox(
                                  child: Text(
                                      'Do you wish to delete the contact? \nOnce deleted it can\'t be reverted back')),
                            ),
                            alignment: Alignment.center,
                            actions: [
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                              TextButton(
                                child: const Text('Confirm'),
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                    contactList.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              ),
              onTap: () async {
                final oldContact = contactList[index];
                final newContact = await Navigator.push<Contactammmm>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddOrEditContact(
                              name: contactList[index].username,
                              phoneNumber: contactList[index].phoneNumber,
                            )));
                setState(() {
                  if (newContact != null) {
                    contactList[index] = newContact;
                  }
                  // showSnackBar(
                  //   'Contact Edited',
                  //   () {
                  //     setState(( ){
                  //       if (newContact != null) {
                  //         contactList[index] = oldContact;
                  //       }
                  //     });
                  //   },
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          setState(() {
                            if (newContact != null) {
                              contactList[index] = oldContact;
                            }
                          });
                        }),
                    content: const Text('Contact Edited'),
                    duration: const Duration(milliseconds: 1500),
                  ));
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newContact = await Navigator.push<Contactammmm>(context,
              MaterialPageRoute(builder: (context) => AddOrEditContact()));
            // final newContact = await Navigator.push<Contactammmm>(context,
            //   DialogRoute(context: context, builder: (context) => newContactDialog()));
          setState(() {
            if (newContact != null) {
              contactList.add(newContact);
            }
            // showSnackBar(
            //   'New Contact added',
            //   () {
            //       if (newContact != null) {
            //         contactList.add(newContact);
            //       }
            //     },
            // );
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    setState(() {
                      if (newContact != null) {
                        contactList.remove(newContact);
                      }
                    });
                  }),
              content: const Text('New contact added'),
              duration: const Duration(milliseconds: 1500),
            ));
          });
        },
        child: const Icon(Icons.person_add),
      ),
      
    );
  }
}

// void newContactDialog() {
//   // flutter defined function
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       // return object of type Dialog
//       return AlertDialog(
        
//       );
//     },
//   );
// }
