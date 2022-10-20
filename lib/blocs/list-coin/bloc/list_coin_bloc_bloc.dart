import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:potacoin/models/coin.dart';
import 'package:potacoin/repositories/list_coin_repository.dart';

part 'list_coin_bloc_event.dart';
part 'list_coin_bloc_state.dart';

class ListCoinBlocBloc extends Bloc<ListCoinBlocEvent, ListCoinBlocState> {
  ListCoinBlocBloc() : super(ListCoinBlocInitial()) {
    on<ListCoinBlocEvent>((event, emit) async {
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
