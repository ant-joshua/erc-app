import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  // const CustomTextInput({Key? key}) : super(key: key);
  final Function? onClick;
  final Function(String)? onSubmit;
  final TextEditingController controller;
  final bool readOnly;
  final bool autoFocus;
  final String? hintText;
  final Icon? icon;

  const CustomTextInput({
    Key? key,
    required this.onClick,
    required this.onSubmit,
    required this.controller,
    this.hintText,
    this.icon,
    this.readOnly = false,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12.withOpacity(0.05)),
          borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            // const Icon(Icons.search, size: 20, color: Colors.black54),
            const SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: widget.controller,
                textInputAction: TextInputAction.done,
                onTap: () => widget.onClick != null ? widget.onClick!() : {},
                keyboardType: TextInputType.text,
                readOnly: widget.readOnly,
                autofocus: widget.autoFocus,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
                onSubmitted: (value) =>
                    widget.onSubmit != null ? widget.onSubmit!(value) : {},
                decoration: InputDecoration(
                  icon: widget.icon,
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
