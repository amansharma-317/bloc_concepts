part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class AddWordEvent extends WishlistEvent {
  List<String> words;
  List<String> fav;

  AddWordEvent(this.words, this.fav);

  @override
  List<Object?> get props => [words, fav];
}

class ShowSnackBarEvent extends WishlistEvent {

  ShowSnackBarEvent();

  @override
  List<Object?> get props => [];
}