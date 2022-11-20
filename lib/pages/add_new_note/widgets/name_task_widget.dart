import 'package:flutter/material.dart';

class NameTaskWidget extends StatelessWidget {
  NameTaskWidget({Key? key, required this.titleTaskController})
      : super(key: key);

  var titleTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: titleTaskController,
        decoration: InputDecoration(
          labelText: "Title",
          labelStyle: theme.textTheme.headline6,
          fillColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
