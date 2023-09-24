import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Notification Settings'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationSettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Account Settings'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: const Center(
        child: Text('Notification settings go here'),
      ),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: const Center(
        child: Text('Account settings go here'),
      ),
    );
  }
}
