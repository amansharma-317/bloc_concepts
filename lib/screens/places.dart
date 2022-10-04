import 'package:flutter/material.dart';
import 'package:foodapp/data/placesmanager.dart';

class Places extends StatelessWidget {
  Places({Key? key}) : super(key: key);

  PlacesManager manager = PlacesManager();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<List<String>>(
          stream: manager.placesListNow,
          builder: (context, snapshot) {
            List<String> places = snapshot.data ?? ['Loading...'];
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(places[index]),
                  );
                },
              separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: places.length,
            );
          },
        )
      ),
    );
  }
}
