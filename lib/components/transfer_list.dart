import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _EmptyListText = "Não há transferências dispníveis";

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];
  final _TransferListState _state = _TransferListState();

  void add(Transfer newTransfer) {
    if (newTransfer == null) return;

    _state.notifyChanged(() {
      _transfers.add(newTransfer);
    });
  }

  @override
  _TransferListState createState() => _state;
}

class _TransferListState extends State<TransferList> {
  void notifyChanged(VoidCallback callback) {
    setState(callback);
  }

  @override
  Widget build(BuildContext context) {
    return widget._transfers.length > 0
        ? ListView.builder(
            itemCount: widget._transfers.length,
            itemBuilder: (context, index) {
              return TransferCard(widget._transfers[index]);
            },
          )
        : Center(child: Text(_EmptyListText));
  }
}

class TransferCard extends StatelessWidget {
  final Transfer _transfer;

  TransferCard(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transfer.value.toString()),
        subtitle: Text(this._transfer.account.toString()),
      ),
    );
  }
}
