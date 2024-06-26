import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});
  static const String routeName = '/contacts_screen';

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool _isLoading = false;

  List<Contact> contacts = [];
  bool isPermissionGranted = false;
  @override
  void initState() {
    super.initState();
    // _requestPermissionAndFetchContacts();
  }

  Future<void> _requestPermissionAndFetchContacts() async {
    final status = await Permission.contacts.status;
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    } else if (status == PermissionStatus.denied) {
      if (await FlutterContacts.requestPermission()) {
        _fetchContacts();
      } else {
        return;
      }
    } else if (status == PermissionStatus.granted) {
      _fetchContacts();
    } else {
      return;
    }
  }

  Future<void> _fetchContacts() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));

    List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true, withThumbnail: true);
    print(contacts);
    setState(() {
      this.contacts = contacts;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Danh bạ',
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Dismissible(
                  key: Key(contact.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      contacts.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${contact.displayName} dismissed')),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kItemPadding)),
                    child: ListTile(
                      leading: (contact.thumbnail != null)
                          ? ClipOval(
                              child: SizedBox(
                                height: kBottomBarIconSize * 3,
                                width: kBottomBarIconSize * 3,
                                child: Image.memory(
                                  contact.thumbnail!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: kBottomBarIconSize * 3,
                              width: kBottomBarIconSize * 3,
                              child: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                            ),
                      title: Text(contact.displayName ?? ''),
                      subtitle: Text(contact.phones[0].number),
                    ),
                  ),
                );
              },
            ),
          ),
          ButtonWidget(
            onTap: _requestPermissionAndFetchContacts,
            title: "Đồng bộ",
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}
