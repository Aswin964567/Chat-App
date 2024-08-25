import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/widgets/global/custom_button.dart';
import 'package:chat_app/widgets/global/custom_textfield.dart';
import 'package:chat_app/widgets/global/password_textfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final void Function()? onTap;
  SignIn({super.key, required this.onTap});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  bool _isLoading = false;

  void login(BuildContext context) async {
    final authService = AuthService();

    setState(() {
      _isLoading = true;
    });

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.pink,
            ))
          : SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * .1,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 300,
                      ),
                      const Positioned(
                        bottom: 45,
                        child: Text(
                          'C H A T  D E M O',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'L O G I N',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    leadingIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    trailingIcon: null,
                  ),
                  PasswordTextField(controller: _passController),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      login(context);
                    },
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
                        onTap: widget.onTap,
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
