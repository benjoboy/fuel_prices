import 'package:flutter/material.dart';

class FuelPrices extends StatefulWidget {
  const FuelPrices({Key? key}) : super(key: key);

  @override
  _FuelPricesState createState() => _FuelPricesState();
}

class _FuelPricesState extends State<FuelPrices> {
  @override
  Widget build(BuildContext context) {
    return Container(child: const Text('prices'));
  }
}
