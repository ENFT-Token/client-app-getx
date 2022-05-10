import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/ui/request_ticket/components/text_field_container.dart';
import 'package:flutter/services.dart';

class RoundedDecimalInputField extends StatelessWidget {
  const RoundedDecimalInputField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.person,
      required this.onChanged,
      required this.onSubmitted})
      : super(key: key);

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      inputFormatters: [
        // 음수가 아닌 소수만 입력 가능
        // 앞이 0인 정수 불가
        FilteringTextInputFormatter.allow(
            RegExp(r'^[0-9]+(\\.[0-9]{1,2})?$')),
      ],
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          counterText: '',
          hintText: hintText,
          border: InputBorder.none),
    ));
  }
}
