// import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:contacts_service/contacts_service.dart';  
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

 class ContactMain extends StatefulWidget {
   @override
   _AccessContactsState createState() => _AccessContactsState();
 }

 class _AccessContactsState extends State<ContactMain> {
   Iterable<Contact> _contacts;

   @override
   void initState() {
     super.initState();
     getContacts();
   }

   getContacts() async {
     print('-----------getcontacts');
     PermissionStatus permissionStatus = await _getPermission();
     if (permissionStatus == PermissionStatus.granted) {
       var contacts = await ContactsService.getContacts();
       print('-----------contacts');
       print(contacts);
       setState(() {
         _contacts = contacts;
       });
     } else {
       throw PlatformException(
         code: 'PERMISSION_DENIED',
         message: 'Access to location data denied',
         details: null,
       );
     }
   }

   Future<PermissionStatus> _getPermission() async {
     PermissionStatus permission = await PermissionHandler()
         .checkPermissionStatus(PermissionGroup.contacts);
     if (permission != PermissionStatus.granted &&
         permission != PermissionStatus.disabled) {
       Map<PermissionGroup, PermissionStatus> permisionStatus =
           await PermissionHandler()
               .requestPermissions([PermissionGroup.contacts]);
       return permisionStatus[PermissionGroup.contacts] ??
           PermissionStatus.unknown;
     } else {
       return permission;
     }
   }

   @override
   Widget build(BuildContext context) {
    //  getContacts();
     return Scaffold(
       appBar: AppBar(title: Text('Access Contacts example')),
       body: _contacts != null
           ? ListView.builder(
               itemCount: _contacts?.length ?? 0,
               itemBuilder: (context, index) {
                 Contact c = _contacts?.elementAt(index);
                 return ListTile(
                   leading: (c.avatar != null && c.avatar.length > 0)
                       ? CircleAvatar(
                           backgroundImage: MemoryImage(c.avatar),
                         )
                       : CircleAvatar(child: Text(c.initials())),
                   title: Text(c.displayName ?? ''),
                 );
               },
             )
           : CircularProgressIndicator(),
     );
   }
 }
