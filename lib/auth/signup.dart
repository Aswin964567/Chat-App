import 'package:chat_app/widgets/global/custom_button.dart';
import 'package:chat_app/widgets/global/custom_textfield.dart';
import 'package:chat_app/widgets/global/password_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController passConfirmController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                'Complete Your Profile',
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
              PasswordTextField(
                controller: passConfirmController,
                hintText: 'Confirm Password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (ctx) => HomePage(),
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do you  have account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (ctx) => const SignIn(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      " Sign In",
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
