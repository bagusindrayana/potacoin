import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:potacoin/models/coin.dart';
import 'package:potacoin/repositories/list_coin_repository.dart';

part 'list_coin_event.dart';
part 'list_coin_state.dart';

class ListCoinBloc extends Bloc<ListCoinEvent, ListCoinBlocState> {
  ListCoinBloc() : super(ListCoinBlocInitial()) {
    on<ListCoinEventLoad>((event, emit) async {
      emit(ListCoinBlocLoading());
      try {
        final coins = await ListCoinRepository().getCoin();
        if (coins != null) {
          emit(ListCoinBlocSuccess(coins));
        } else {
          emit(ListCoinBlocError("Tidak ada data coin"));
        }
      } catch (e) {
        emit(ListCoinBlocError(e.toString()));
      }
    });
  }
}
