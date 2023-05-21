import 'package:flutter/material.dart';
import 'package:tarot/classes/tarot_card.dart';
import 'dart:math';

class OneCard extends StatefulWidget {
  final List<TarotCard> cards;
  _OneCardState createState() => _OneCardState(cards: cards);
  OneCard({required this.cards});
}

class _OneCardState extends State<OneCard> {

  final List<TarotCard> cards;
  TarotCard card = TarotCard(name: 'Card Back', imagePath: 'assets/cards/card_back.png', description: 'none', positive: 'positive', negative: 'negative');
  _OneCardState({required this.cards});

  void toggleCardState() {
    setState(() {
      if (card.name == 'Card Back') {
        Random random = Random();
        int rand = random.nextInt(78); 
        card = cards[rand];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('One Card Spread')),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      toggleCardState();
                    },
                    child: Card(
                    child: Container(
                      width: 200,
                      height: 351.33,
                      child: Image(
                        image: AssetImage(card.imagePath),
                        fit: BoxFit.contain,
                      ),
                    ), 
                  ),
                ),
                  if(card.name != 'Card Back') ...[
                    const SizedBox(height: 8.0,),
                    Text(card.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    const SizedBox(height: 16.0,),
                    const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(card.description, textAlign: TextAlign.center,),
                    const SizedBox(height: 16.0, ),
                    const Text('Positive', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(card.positive, textAlign: TextAlign.center,),
                    const SizedBox(height: 16.0,),
                    const Text('Negative', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(card.negative, textAlign: TextAlign.center,),
                  ]
              ],
            ),
          ),
        ),
      )
    );
  }
}