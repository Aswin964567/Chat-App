import 'package:chat_app/auth/signup.dart';
import 'package:chat_app/widgets/global/custom_button.dart';
import 'package:chat_app/widgets/global/custom_textfield.dart';
import 'package:chat_app/widgets/global/password_textfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * .3,
            ),
            // Image.asset(
            //   'assets/images/splash_screen.png',
            //   height: 200,
            // ),
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: userController,
              hintText: 'Username',
              leadingIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              trailingIcon: null,
            ),
            PasswordTextField(controller: passController),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Sign In',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have account?',
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const SignUp(),
                      ),
                    );
                  },
                  child: const Text(
                    " Sign Up",
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
