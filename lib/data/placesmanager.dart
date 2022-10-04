List<String> PLACES = ['Burger King', 'KFC', 'Food Court', 'Dummy place 4'];

class PlacesManager {
  Stream<List<String>> get placesListNow async* {
    for (var i =0; i < PLACES.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield PLACES.sublist(0, i + 1);

    }
  }
}