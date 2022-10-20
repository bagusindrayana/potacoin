import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potacoin/blocs/list-exchange/bloc/list_exchange_bloc.dart';

class ExchangesElement extends StatefulWidget {
  const ExchangesElement({Key? key}) : super(key: key);

  @override
  State<ExchangesElement> createState() => _ExchangesElementState();
}

class _ExchangesElementState extends State<ExchangesElement> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListExchangeBloc(),
      child: BlocBuilder<ListExchangeBloc, ListExchangeBlocState>(
        builder: (context, state) {
          if (state is ListExchangeBlocInitial) {
            BlocProvider.of<ListExchangeBloc>(context)
                .add(ListExchangeEventLoad());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListExchangeBlocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListExchangeBlocSuccess) {
            return RefreshIndicator(
                child: ListView.builder(
                  itemCount: state.exchanges.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        "${state.exchanges[index].image}",
                        width: 50,
                      ),
                      title: Text(state.exchanges[index].name),
                      subtitle:
                          Text("${state.exchanges[index].yearEstablished}"),
                      trailing:
                          Text("${state.exchanges[index].tradeVolume_24hBtc}"),
                    );
                  },
                ),
                onRefresh: () async {
                  BlocProvider.of<ListExchangeBloc>(context)
                      .add(ListExchangeEventLoad());
                });
          } else if (state is ListExchangeBlocError) {
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
                  BlocProvider.of<ListExchangeBloc>(context)
                      .add(ListExchangeEventLoad());
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
