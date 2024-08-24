import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.leadingIcon,
    required this.trailingIcon,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * .05;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextField(
        controller: controller,
        
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: leadingIcon,
          suffixIcon:trailingIcon,
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
