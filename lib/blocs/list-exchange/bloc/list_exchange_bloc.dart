import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:potacoin/models/exchange.dart';
import 'package:potacoin/repositories/list_exchange_repository.dart';

part 'list_exchange_event.dart';
part 'list_exchange_state.dart';

class ListExchangeBloc extends Bloc<ListExchangeEvent, ListExchangeBlocState> {
  ListExchangeBloc() : super(ListExchangeBlocInitial()) {
    on<ListExchangeEventLoad>((event, emit) async {
      emit(ListExchangeBlocLoading());
      try {
        final exchanges = await ListExchangeRepository().getExchange();
        if (exchanges != null) {
          emit(ListExchangeBlocSuccess(exchanges));
        } else {
          emit(ListExchangeBlocError("Tidak ada data exchange"));
        }
      } catch (e) {
        emit(ListExchangeBlocError(e.toString()));
      }
    });
  }
}
