import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class BayarScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BayarScreen> {
  late int _counter;

  void _pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-Yv7dsSIwwaPm1vjGZayy3A');
    InAppPayments.startCardEntryFlow(
      onCardEntryCancel: _cardEntryCancel,
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
    );
  }

  void _cardEntryCancel() {
    // Cancel
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    // Use this nonce from your backend to pay via Square API
    print(result.nonce);

    final bool _invalidZipCode = false;

    if (_invalidZipCode) {
      // Stay in the card flow and show an error:
      InAppPayments.showCardNonceProcessingError('Invalid ZipCode');
    }

    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {
    // Success
    _resetCounter();
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        tooltip: 'Pay',
        child: Icon(Icons.payment),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          icon: Icon(Icons.remove),
        ),
      ],
    );
  }
}
