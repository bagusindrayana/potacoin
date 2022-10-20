import 'package:flutter/material.dart';

class TrendingCoinElement extends StatefulWidget {
  const TrendingCoinElement({Key? key}) : super(key: key);

  @override
  State<TrendingCoinElement> createState() => _TrendingCoinElementState();
}

class _TrendingCoinElementState extends State<TrendingCoinElement> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Trending Coin"),
    );
  }
}
