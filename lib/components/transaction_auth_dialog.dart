import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  const TransactionAuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 48,
          letterSpacing: 12,
        ),
      ),
      actions: [
        TextButton(
          onPressed: null,
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: null,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
