import 'package:flutter/material.dart';

class FormFiled extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final IconData icon;
  const FormFiled(
      {required this.textEditingController,
      required this.hintText,
      Key? key,
      required this.icon})
      : super(key: key);

  @override
  _FormFiledState createState() => _FormFiledState();
}

class _FormFiledState extends State<FormFiled> {
  bool pwdVisibility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        hintText: widget.hintText,
        // suffixIcon: InkWell(
        //   onTap: () => setState(
        //     () => pwdVisibility = !pwdVisibility,
        //   ),
        //   child: Icon(
        //     pwdVisibility
        //         ? Icons.visibility_outlined
        //         : Icons.visibility_off_outlined,
        //     color: const Color(0xFF7F59B0),
        //     size: 18,
        //   ),
        // ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.orange,
        ),
        prefixIconColor: Colors.orange,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
