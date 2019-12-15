// import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:contacts_service/contacts_service.dart';  
// import 'package:flutter/services.dart';
// import 'package:permission_handler/permission_handler.dart';

//  class Contact extends StatefulWidget {
//    @override
//    _AccessContactsState createState() => _AccessContactsState();
//  }

//  class _AccessContactsState extends State<Contact> {
//    Iterable<Contact> _contacts;

//    @override
//    void initState() {
//      super.initState();
//    }

//    getContacts() async {
//      PermissionStatus permissionStatus = await _getPermission();
//      if (permissionStatus == PermissionStatus.granted) {
//        var contacts = await ContactsService.getContacts();
//        setState(() {
//          _contacts = contacts;
//        });
//      } else {
//        throw PlatformException(
//          code: 'PERMISSION_DENIED',
//          message: 'Access to location data denied',
//          details: null,
//        );
//      }
//    }

//    Future<PermissionStatus> _getPermission() async {
//      PermissionStatus permission = await PermissionHandler()
//          .checkPermissionStatus(PermissionGroup.contacts);
//      if (permission != PermissionStatus.granted &&
//          permission != PermissionStatus.disabled) {
//        Map<PermissionGroup, PermissionStatus> permisionStatus =
//            await PermissionHandler()
//                .requestPermissions([PermissionGroup.contacts]);
//        return permisionStatus[PermissionGroup.contacts] ??
//            PermissionStatus.unknown;
//      } else {
//        return permission;
//      }
//    }

//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(title: Text('Access Contacts example')),
//        body: _contacts != null
//            ? ListView.builder(
//                itemCount: _contacts?.length ?? 0,
//                itemBuilder: (context, index) {
//                  Contact c = _contacts?.elementAt(index);
//                  return ListTile(
//                    leading: (c.avatar != null && c.avatar.length > 0)
//                        ? CircleAvatar(
//                            backgroundImage: MemoryImage(c.avatar),
//                          )
//                        : CircleAvatar(child: Text(c.initials())),
//                    title: Text(c.displayName ?? ''),
//                  );
//                },
//              )
//            : CircularProgressIndicator(),
//      );
//    }
//  }
class Contact extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("Contacts"),
            ),
            body: new ContactList(kContacts));
      }
    }

    const kContacts = const <ContactModal>[
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com')
    ];

    

    class ContactList extends StatelessWidget {
      final List<ContactModal> _contacts;

      ContactList(this._contacts);

      // static Future<Iterable> getContact() async {
      //   Iterable contacts = await ContactsService.getContacts(); 
      //   print('---------------contacts');
      //   print(contacts);
      //   return contacts;
      // }
      Future<List<Contact>> getContact() async {

        var data = await ContactsService.getContacts(); 

        // var jsonData = json.decode(data);
        print('---------jsonData');
        print(data);

        // List<String> users = [];

        // for(var u in jsonData){

        //   User user = User(u["index"], u["about"], u["name"], u["email"], u["picture"]);

        //   users.add(user);

        // }

        // print(users.length);

        // return users;
        // return data;

      }

      @override
      Widget build(BuildContext context) {
        print('---------------getContact');
        var contacts = getContact();

        return new ListView.builder(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          itemBuilder: (context, index) {
            return new _ContactListItem(_contacts[index]);
          },
          itemCount: _contacts.length,
        );
      }
    }

    class _ContactListItem extends ListTile {
      _ContactListItem(ContactModal contact)
          : super(
                title: new Text(contact.fullName),
                subtitle: new Text(contact.email),
                leading: new CircleAvatar(child: new Text(contact.fullName[0])));
    }

    class ContactModal {
      final String fullName;
      final String email;

      const ContactModal({this.fullName, this.email});
    }