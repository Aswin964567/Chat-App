import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

   const PasswordTextField({super.key, required this.controller, this.hintText = 'Password'});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  void obscure(){
    setState(() {
      obscureText= !obscureText;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * .05;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextField(
        controller: widget.controller,
        obscureText: obscureText,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(
                  Icons.key,
                  color: Colors.grey,
                ),
          suffixIcon:IconButton(onPressed: obscure, icon: obscureText?const Icon(Icons.visibility):const Icon(Icons.visibility_off)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 4),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        cursorColor: Colors.grey[700],
      ),
    );
  }
}