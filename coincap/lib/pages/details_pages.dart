import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  final Map rates;

  const DetailsPage({super.key, required this.rates});

  @override
  Widget build(BuildContext context) {
    List _currencies = rates.keys.toList();
    List _exchangeRates = rates.values.toList();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _currencies.length,
          itemBuilder: (BuildContext _context, int _index) {
            String _currency = _currencies[_index].toString().toUpperCase();
            String _exchangeRate = _exchangeRates[_index].toString();
            return ListTile(
              title: Text('$_currency: $_exchangeRate', style: const TextStyle(color: Colors.white, fontSize: 20),),
            );
          },
        ),
      ),
    );
  }
}