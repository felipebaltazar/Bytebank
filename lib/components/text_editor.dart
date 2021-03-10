import 'package:flutter/material.dart';

class NumberEditor extends StatelessWidget {
  final TextEditingController _controller;
  final IconData icon;
  final String label;
  final String hint;

  const NumberEditor(this._controller, {this.icon, this.label, this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          icon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
