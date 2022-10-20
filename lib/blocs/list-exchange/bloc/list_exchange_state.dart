part of 'list_exchange_bloc.dart';

@immutable
abstract class ListExchangeBlocState {}

class ListExchangeBlocInitial extends ListExchangeBlocState {}

//loading state
class ListExchangeBlocLoading extends ListExchangeBlocState {}

//success state
class ListExchangeBlocSuccess extends ListExchangeBlocState {
  final List<Exchange> exchanges;

  ListExchangeBlocSuccess(this.exchanges);
}

//error state
class ListExchangeBlocError extends ListExchangeBlocState {
  final String message;

  ListExchangeBlocError(this.message);
}
