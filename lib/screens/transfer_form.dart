import 'package:bytebank/components/text_editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _TransferFormTitle = "Nova Transferência";
const _ConfirmButtonText = "Confirmar";
const _AccountLabel = "Conta";
const _AccountHint = "0000";
const _ValueLabel = "Valor";
const _ValueHint = "0.00";

class TransferFormPage extends StatefulWidget {
  TransferFormPage();

  @override
  _TransferFormPageState createState() => _TransferFormPageState();
}

class _TransferFormPageState extends State<TransferFormPage> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  void _onConfirmButtonPressed() {
    final value = double.tryParse(_valueController.text);
    final account = int.tryParse(_accountController.text);

    if (value == null || account == null) return;

    final transfer = Transfer(value, account);

    Navigator.pop(context, transfer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_TransferFormTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NumberEditor(
              _accountController,
              label: _AccountLabel,
              hint: _AccountHint,
            ),
            NumberEditor(
              _valueController,
              label: _ValueLabel,
              hint: _ValueHint,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_ConfirmButtonText),
              onPressed: _onConfirmButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
