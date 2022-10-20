import 'package:flutter/material.dart';

class ExchangesElement extends StatefulWidget {
  const ExchangesElement({Key? key}) : super(key: key);

  @override
  State<ExchangesElement> createState() => _ExchangesElementState();
}

class _ExchangesElementState extends State<ExchangesElement> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Exchanges"),
    );
  }
}
