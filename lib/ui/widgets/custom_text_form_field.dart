import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String title;
  final bool obscure;
  final Function(String)? onchanged;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.obscure = false,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextSyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kBlackColor,
            autofocus: true,
            obscureText: obscure,
            onChanged: onchanged,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.singleLineFormatter,
            ],
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  17,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  17,
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
