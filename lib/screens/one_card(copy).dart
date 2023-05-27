import 'package:flutter/material.dart';
import 'package:tarot/classes/tarot_card.dart';
import 'package:tarot/classes/tarot_widget.dart';

class OneCard extends StatefulWidget {
  final List<TarotCard> cards;
  _OneCardState createState() => _OneCardState();
  OneCard({required this.cards});
}

class _OneCardState extends State<OneCard> {
  List<TarotCard> cardsCopy = List.empty();
  TarotCard card = TarotCard(
      name: 'Card Back',
      imagePath: 'assets/cards/card_back.png',
      description: 'none',
      positive: 'positive',
      negative: 'negative');

  @override
  void initState() {
    super.initState();
    cardsCopy = List.from(widget.cards);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('One Card Spread')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: TarotWidget(cards: cardsCopy,),   
            ),
          ),
        ),
      );
    
  }
}
