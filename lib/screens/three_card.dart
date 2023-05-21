import 'package:flutter/material.dart';
import 'package:tarot/classes/tarot_card.dart';
import 'dart:math';

class ThreeCard extends StatefulWidget {
  final List<TarotCard> cards;
  _ThreeCardState createState() => _ThreeCardState(cards: cards);
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
  
  final List<TarotCard> cards;
  List<TarotCard> cardsCopy;
  _ThreeCardState({required this.cards})
    : cardsCopy = List.from(cards);

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
        child: 
        Padding(padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      const Text('Past', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                      if(cardPast.name != 'Card Back') ...[
                        Text(cardPast.name, style: const TextStyle(fontWeight: FontWeight.bold,),)
                      ],
                      InkWell(
                      onTap: () {
                        revealCard(cardPast);
                      },
                      child: Card(
                        child: Container(
                          width: 150,
                          height: 263.5,
                          child: Image(
                            image: AssetImage(cardPast.imagePath),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    ]
                  ),
                  
                  const SizedBox(width: 32.0,),

                  Column(
                    children: [
                      const Text('Future', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                      if(cardFuture.name != 'Card Back') ...[
                        Text(cardFuture.name, style: const TextStyle(fontWeight: FontWeight.bold,),)
                      ],
                      InkWell(
                        onTap: () {
                          revealCard(cardFuture);
                        },
                        child: Card(
                          child: Container(
                            width: 150,
                            height: 263.5,
                            child: Image(
                              image: AssetImage(cardFuture.imagePath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 16.0,),
              Column(
                children: [
                  const Text('Present', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                  if(cardPresent.name != 'Card Back') ...[
                        Text(cardPresent.name, style: const TextStyle(fontWeight: FontWeight.bold,),)
                      ],
                  InkWell(
                    onTap: () {
                      revealCard(cardPresent);
                    },
                    child: Card(
                      child: Container(
                        width: 150,
                        height: 263.5,
                        child: Image(
                          image: AssetImage(cardPresent.imagePath),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  if(description != '') ...[
                    const SizedBox(height: 16.0,),
                    const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(description, textAlign: TextAlign.center,),
                    const SizedBox(height: 16.0, ),
                    const Text('Positive', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(positive, textAlign: TextAlign.center,),
                    const SizedBox(height: 16.0,),
                    const Text('Negative', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(negative, textAlign: TextAlign.center,),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}