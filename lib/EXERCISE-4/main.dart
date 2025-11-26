import 'package:flutter/material.dart';
import 'data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
    home: FavoriteJokesApp(),
  )
);

class FavoriteJokesApp extends StatefulWidget {
  const FavoriteJokesApp({
    super.key,
  });

  @override
  State<FavoriteJokesApp> createState() => _FavoriteJokesAppState();
}

class _FavoriteJokesAppState extends State<FavoriteJokesApp> {

  void onFavoriteClick(int index) {
    setState(() {
      for (int i = 0; i < jokes.length; i++) {
        if (i == index) {
          jokes[i].isFavorite = !jokes[i].isFavorite; 
        } else {
          jokes[i].isFavorite = false; 
        }
      }    
   });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
      body: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) {
            return FavoriteCard(
              jokes: jokes[index],
              onFavoriteClick: () => onFavoriteClick(index),
            );
          },
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Jokes jokes;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.jokes,
    required this.onFavoriteClick,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jokes.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(jokes.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              jokes.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: jokes.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
