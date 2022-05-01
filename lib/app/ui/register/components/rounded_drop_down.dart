import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class RoundedDropDown extends StatefulWidget {
  RoundedDropDown(
      {Key? key, required this.values, this.textColor = Colors.white})
      : super(key: key);

  final List values;
  final Color textColor;

  @override
  State<RoundedDropDown> createState() => RoundedDropDownState();
}

class RoundedDropDownState extends State<RoundedDropDown> {
  String selectedValue = "남자";


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // total height = margin 20 + hint 20
    // if(context.read<UserProvider>().registerJson['sex'] == "") context.read<UserProvider>().registerJson['sex'] = "male";
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(29.0),
          border: Border.all(
              color: kPrimaryLightColor, style: BorderStyle.solid, width: 0.80),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Theme(
                data: ThemeData(
                  canvasColor: kPrimaryLightColor,
                  primaryColor: Colors.white,
                  // primaryColor: kPrimaryLightColor,
                ),
                child: // Your Dropdown Code Here,
                    DropdownButtonHideUnderline(
                        child: ButtonTheme(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  alignedDropdown: true,
                  child: DropdownButton(
                    elevation: 0,
                    borderRadius: BorderRadius.all(Radius.circular(29.0)),
                    hint: Text("성별을 고르세요"),
                    items: widget.values
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value.toString();
                        // if(selectedValue == "남자") context.read<UserProvider>().registerJson['sex'] = "male";
                        // else context.read<UserProvider>().registerJson['sex'] = "female";
                      });
                    },
                  ),
                )))));
  }
}
