import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:chat_app/widgets/features/user_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logOut(BuildContext context) async {
    await _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "All Users",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.pink,
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: _buildUserList(),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading"));
        }
        if (snapshot.hasData) {
          final users = snapshot.data!;
          return ListView(
            children: users.map<Widget>((userData) {
              return _buildUserListItem(userData, context);
            }).toList(),
          );
        } else {
          return const Center(child: Text("No users found"));
        }
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    final currentUser = _authService.getCurrentUser();

    if (userData["email"] != currentUser?.email) {
      return UserTile(
        name: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiver: userData["email"],
                receiverId: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  Widget _buildDrawer(BuildContext context) {
    return SizedBox(
      width: 220, // Reduced width of the drawer
      child: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 150,
                ),
                const Positioned(
                  bottom: 25,
                  child: Text(
                    'C H A T  D E M O',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              tileColor: Colors.grey[350],
              leading: const Icon(Icons.home, color: Colors.black),
              title:
                  const Text('H O M E', style: TextStyle(color: Colors.black)),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text('L O G O U T',
                  style: TextStyle(color: Colors.black)),
              onTap: () => logOut(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
