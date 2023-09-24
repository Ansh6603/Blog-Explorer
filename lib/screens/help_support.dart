import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const Text(
            'Contact Information:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email: support@example.com'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone: +1 123-456-7890'),
            onTap: () {},
          ),
          const Divider(),
          const Text(
            'Frequently Asked Questions:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('How do I reset my password?'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('What should I do if I encounter an issue?'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
