import 'package:bottom_navigators/ui/products.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ...List.generate(like.length, (index) => ListTile(
                title: Text(like[index][0]),
              ))
            ],
          ),
        ],
      )
    );
  }
}
