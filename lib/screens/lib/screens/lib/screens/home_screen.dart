import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = AuthService().currentUserEmail ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Friendly'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              AuthService().signOut();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi ${email.split('@').first} 👋',
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              const Text(
                'Welcome to your home screen',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.chat_bubble_outline_rounded),
                        title: Text('Start a chat'),
                        subtitle: Text('Open a new conversation'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.star_border),
                        title: Text('Highlights'),
                        subtitle: Text('See what\'s trending'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
