import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/widgets/global/custom_button.dart';
import 'package:chat_app/widgets/global/custom_textfield.dart';
import 'package:chat_app/widgets/global/password_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final void Function()? onTap;
  SignUp({super.key, required this.onTap});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

  bool _isLoading = false;

  // Register function
  void register(BuildContext context) async {
    final auth = AuthService();
    if (_passController.text == _passConfirmController.text) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });
      try {
        await auth.signUpWithEmailAndPassword(
            _emailController.text, _passController.text);

        // Navigate to Home screen after successful sign-up
        Navigator.pushReplacementNamed(
            context, '/home'); // Adjust based on your routes
      } catch (e) {
        setState(() {
          _isLoading = false; // Hide loading indicator on error
        });
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Password Mismatch'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.pink,
            ))
          : 
      SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * .1,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 250,
                  ),
                  const Positioned(
                    bottom: 40,
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
              const Text(
                'R E G I S T E R',
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
                controller: _emailController,
                hintText: 'Email',
                leadingIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                trailingIcon: null,
              ),
              PasswordTextField(controller: _passController),
              PasswordTextField(
                controller: _passConfirmController,
                hintText: 'Confirm Password',
              ),
              const SizedBox(
                height: 50,
              ),
             CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        register(context);
                      },
                    ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do you have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
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
