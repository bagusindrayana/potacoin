import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potacoin/blocs/list-coin/bloc/list_coin_bloc.dart';
import 'package:potacoin/pages/home_page_elelements/exchanges_element.dart';
import 'package:potacoin/pages/home_page_elelements/market_price_element.dart';
import 'package:potacoin/pages/home_page_elelements/trending_coin_element.dart';

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// Dont't forget this
    super.build(context);

    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _pageElements = <Widget>[
    KeepAlivePage(child: MarketPriceElement()),
    KeepAlivePage(child: ExchangesElement()),
    KeepAlivePage(child: TrendingCoinElement())
  ];
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PotaCoin"),
      ),
      //bloc provider load list coin
      body: PageView(
        controller: _pageController,
        children: _pageElements,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.transform_rounded),
            label: 'Exchanges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trending',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
