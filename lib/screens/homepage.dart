import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/app_bloc.dart';
import 'package:foodapp/cubit/theme_cubit.dart';

import 'package:foodapp/screens/favourites.dart';
import 'package:foodapp/screens/places.dart';
import 'package:foodapp/wishlist_bloc/wishlist_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> words = ['Pizza', 'Sushi', 'Pasta'];

  List<String> favs = List<String>.empty(growable: true);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      listener: (context, state) {
        if (state is ShowSnackBarState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('You can see the places to eat by clicking on the Places tab!')));
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: ElevatedButton(
                      child: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<WishlistBloc>(context),
                                  child: Favourites(favoriteItems: favs),
                                )
                            )
                        );
                      },
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: ElevatedButton(
                      child: Icon(Icons.restaurant_menu),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (newContext) => BlocProvider.value(
                                  value: BlocProvider.of<WishlistBloc>(context),
                                  child: Places(),
                                )
                            )
                        );
                      },
                    ),
                    label: 'Places',
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            children: [
                              Text('Food App'),
                              Spacer(),
                              Icon(Icons.search_rounded),
                            ]
                        ),
                        SizedBox(height: 30),
                        Text('Today\'s Special', style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700)),
                        SizedBox(height: 10),
                        Text('Fresh food menu', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<WishlistBloc>(context)..add(ShowSnackBarEvent());

                            },
                          child: Text('???'),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Pizza', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900)),
                            Text('Pasta', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                            Text('Salads', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 24),
                        Flexible(
                          fit: FlexFit.loose,
                          child: SizedBox(
                            height: 300,
                            child: ListView.separated(
                              itemCount: words.length,
                              separatorBuilder: (BuildContext context, int index) => Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                String word = words[index].toString();
                                bool isSaved = favs.contains(word);

                                return ListTile(
                                  title: Text(word),
                                  trailing: Icon(
                                    Icons.add,
                                    color: Colors.red,
                                  ),
                                  onTap: () {
                                    if (isSaved) {
                                      favs.remove(word);
                                    } else {
                                      favs.add(word);
                                    }
                                    BlocProvider.of<WishlistBloc>(context)..add(AddWordEvent(words, favs));
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        ElevatedButton(
                            onPressed: () {
                             final cubit = context.read<ThemeCubit>();
                             cubit.toggleTheme();
                            },
                            child: Text('Toggle Theme'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        );
      }
    );
  }
}
