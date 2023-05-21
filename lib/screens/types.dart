import 'package:flutter/material.dart';
import 'package:tarot/classes/tarot_card.dart';

class Types extends StatelessWidget {
  final List<TarotCard> cards;
  const Types({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a type of draw')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/one_card');
          }, child: const Text('One Card Spread')), 
          ElevatedButton(onPressed: () {
      
          }, child: const Text('Three Card Spread')),
          ElevatedButton(onPressed: () {
      
          }, child: const Text('Five Card Spread')),
          ElevatedButton(onPressed: () {
            
          }, child: const Text('Celtic Cross Spread'))
      
        ],
        ),
      )
    );
  }
}