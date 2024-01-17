import 'package:flutter/material.dart';

//TODO this needs to be made generic later
AlertDialog alertDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Location Service Not Available'),
    content: const Text('Please enable location services to use this feature.'),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('OK'),
      ),
    ],
  );
}
