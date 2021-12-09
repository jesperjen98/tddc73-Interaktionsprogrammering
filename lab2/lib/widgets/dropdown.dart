import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lab2/widgets/application.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final DropDownController dropDownController;

  const CustomDropdown(
      {Key? key, required this.items, required this.dropDownController})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? curValue;
  String? identifier;

  @override
  void initState() {
    // TODO: implement initState
    curValue = widget.items[0];
    identifier = widget.items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 17.5),
          border: OutlineInputBorder()),
      value: curValue,
      onChanged: (String? newValue) {
        if (newValue != null) {
          widget.dropDownController.updateValue(newValue);
        }
        setState(() {
          curValue = newValue!;
        });
      },
      items: widget.items.map((String items) {
        return DropdownMenuItem(value: items, child: Text(items));
      }).toList(),
    );
  }
}
