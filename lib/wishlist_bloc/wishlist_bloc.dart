import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'wishlist_state.dart';
part 'wishlist_event.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<AddWordEvent>((event, emitter) {
      emit(WishlistLoaded(event.words, event.fav));
    });

    on<ShowSnackBarEvent>((event, emitter) {
      emit(ShowSnackBarState());
    });
  }
}