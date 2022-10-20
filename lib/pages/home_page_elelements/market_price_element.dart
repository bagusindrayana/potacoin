import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potacoin/blocs/list-coin/bloc/list_coin_bloc_bloc.dart';

class MarketPriceElement extends StatefulWidget {
  const MarketPriceElement({Key? key}) : super(key: key);

  @override
  State<MarketPriceElement> createState() => _MarketPriceElementState();
}

class _MarketPriceElementState extends State<MarketPriceElement> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListCoinBlocBloc(),
      child: BlocBuilder<ListCoinBlocBloc, ListCoinBlocState>(
        builder: (context, state) {
          if (state is ListCoinBlocInitial) {
            BlocProvider.of<ListCoinBlocBloc>(context)
                .add(ListCoinBlocEventLoad());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListCoinBlocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListCoinBlocSuccess) {
            return ListView.builder(
              itemCount: state.coins.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    state.coins[index].image,
                    width: 50,
                  ),
                  title: Text(state.coins[index].name),
                  subtitle: Text(state.coins[index].symbol),
                  trailing: Text("${state.coins[index].currentPrice}"),
                );
              },
            );
          } else if (state is ListCoinBlocError) {
            return RefreshIndicator(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.1,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(state.message),
                    ),
                  ),
                ),
                onRefresh: () async {
                  BlocProvider.of<ListCoinBlocBloc>(context)
                      .add(ListCoinBlocEventLoad());
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
