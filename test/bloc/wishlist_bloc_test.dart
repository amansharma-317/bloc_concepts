import 'package:flutter_test/flutter_test.dart';
import 'package:foodapp/wishlist_bloc/wishlist_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {

  List<String> words = ['hello, bye, cya', 'bye, hello, cya', 'cya, hello, bye'];

  List<String> favs = List<String>.empty(growable: true);
  group('Wishlist Bloc', () {
    late WishlistBloc wishlistBloc;

    setUp(() {
      wishlistBloc = WishlistBloc();
    });

    test('initial state of wishlist bloc is wishlistloading',
            () {
      expect(wishlistBloc.state, WishlistLoading());
    });

    blocTest(
        'checking wishlistloaded emitted correctly or not',
        build: () => wishlistBloc,
        act: (bloc) => bloc.add(AddWordEvent(words, favs)),
        expect: () => [WishlistLoaded(words, favs)],
    );

    blocTest(
      'checking wishlistloaded emitted correctly or not',
      build: () => wishlistBloc,
      act: (bloc) => bloc.add(ShowSnackBarEvent()),
      expect: () => [ShowSnackBarState()],
    );

  });
}