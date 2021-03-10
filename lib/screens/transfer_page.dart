import 'package:bytebank/components/transfer_list.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer_form.dart';
import 'package:flutter/material.dart';

const _TransferPageTitle = "Transferências";
const _CreateTransferTooltip = 'Create Transfer';

class TransferPage extends StatelessWidget {
  final TransferList _transferList = TransferList();

  void _createTransfer(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TransferFormPage();
      // ignore: missing_return
    })).then<Transfer>((newTransfer) {
      _transferList.add(newTransfer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_TransferPageTitle),
      ),
      body: Center(
        child: _transferList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createTransfer(context),
        tooltip: _CreateTransferTooltip,
        child: Icon(Icons.add),
      ),
    );
  }
}
