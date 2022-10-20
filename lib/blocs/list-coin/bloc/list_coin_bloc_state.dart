part of 'list_coin_bloc_bloc.dart';

@immutable
abstract class ListCoinBlocState {}

class ListCoinBlocInitial extends ListCoinBlocState {}

//loading state
class ListCoinBlocLoading extends ListCoinBlocState {}

//success state
class ListCoinBlocSuccess extends ListCoinBlocState {
  final List<Coin> coins;

  ListCoinBlocSuccess(this.coins);
}

//error state
class ListCoinBlocError extends ListCoinBlocState {
  final String message;

  ListCoinBlocError(this.message);
}
