import 'package:flutter/material.dart';
import 'package:tarot/classes/tarot_card.dart';
import 'dart:math';
import 'package:tarot/classes/tarot_widget.dart';

class ThreeCard extends StatefulWidget {
  final List<TarotCard> cards;
  _ThreeCardState createState() => _ThreeCardState();
  ThreeCard({required this.cards});
}

class _ThreeCardState extends State<ThreeCard> {

  TarotCard cardPast = TarotCard(name: 'Card Back', imagePath: 'assets/cards/card_back.png', description: 'none', positive: 'positive', negative: 'negative');
  TarotCard cardPresent = TarotCard(name: 'Card Back', imagePath: 'assets/cards/card_back.png', description: 'none', positive: 'positive', negative: 'negative');
  TarotCard cardFuture = TarotCard(name: 'Card Back', imagePath: 'assets/cards/card_back.png', description: 'none', positive: 'positive', negative: 'negative');
  String description = '';
  String positive = '';
  String negative = '';
  bool showCardPast = false;
  bool showCardPresent = false;
  bool showCardFuture = false;
  
  List<TarotCard> cardsCopy = List.empty();

  @override
  void initState() {
    super.initState();
    cardsCopy = List.from(widget.cards);
  }

  void revealCard(TarotCard curCard) {
    setState(() {
      if(curCard.name == 'Card Back') {
        Random random = Random();
        int rand = random.nextInt(cardsCopy.length);
        description = cardsCopy[rand].description;
        positive = cardsCopy[rand].positive;
        negative = cardsCopy[rand].negative;
        if(curCard == cardPast) {
          cardPast = cardsCopy[rand];
        }
        else if(curCard == cardFuture) {
          cardFuture = cardsCopy[rand];
        }
        else if (curCard == cardPresent) {
          cardPresent = cardsCopy[rand];
        }
        cardsCopy.removeAt(rand);
      }
      else {
        description = curCard.description;
        positive = curCard.positive;
        negative = curCard.negative;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Three Card Spread'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                TarotWidget(cards: cardsCopy),
                const SizedBox(height: 16.0,),
                TarotWidget(cards: cardsCopy),
                const SizedBox(height: 16.0,),
                TarotWidget(cards: cardsCopy),
              ]
            ),
          ),
        ),
      ),
    );
  }
}