import 'package:bytebank/screens/transfer_page.dart';
import 'package:flutter/material.dart';

const _ApplicationTitle = "Byte Bank";

void main() {
  runApp(ByteBankApplication());
}

class ByteBankApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _ApplicationTitle,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TransferPage(),
    );
  }
}
