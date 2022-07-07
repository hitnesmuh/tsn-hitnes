import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.obsecureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obsecureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
