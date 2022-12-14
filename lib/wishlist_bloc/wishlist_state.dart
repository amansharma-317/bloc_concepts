part of 'wishlist_bloc.dart';



abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {

  @override
  List<Object?> get props => [];
}

class WishlistLoaded extends WishlistState {
  final List<String> words;
  final List<String> favs;

  WishlistLoaded(this.words, this.favs);

  @override
  List<Object?> get props => [words, favs];
}

class ShowSnackBarState extends WishlistState {

  @override
  List<Object?> get props => [];
}