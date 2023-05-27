import 'package:flutter/material.dart';
import 'package:tarot/classes/tarot_card.dart';
import 'dart:math';

class TarotWidget extends StatefulWidget {
  final List<TarotCard> cards;
  const TarotWidget({super.key, required this.cards});

  @override
  State<TarotWidget> createState() => _TarotWidgetState();
}

class _TarotWidgetState extends State<TarotWidget> {

  int count = 0;
  TarotCard card = TarotCard(name: 'Card Back', imagePath: 'assets/cards/card_back.png', description: '', positive: '', negative: '');
    
  
  void randomCard(){
    setState(() {
      if (card.name == 'Card Back') {
        Random random = Random();
        int rand = random.nextInt(widget.cards.length);
        card = widget.cards[rand];
        widget.cards.removeAt(rand);
        print(widget.cards.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      const aspectRatio = 9 / 16;
      final desiredHeight = (maxWidth - maxWidth / 1.7) / aspectRatio;
      return Row(
        children: [
          Container(
            width: desiredHeight * aspectRatio,
            height: desiredHeight,
            constraints: const BoxConstraints(
              maxHeight: 500,
              maxWidth: 300,
              minHeight: 10,
              minWidth: 6
            ),
            child: InkWell(
              onTap: () {
                randomCard();
              },
              child: Image(
                image: AssetImage(card.imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          Visibility(
            visible: card.name != 'Card Back',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight/2.2,
                  maxWidth: constraints.maxWidth/2.2
                  ),  
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                        Text(card.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                        const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(card.description),
                        const Text('Positive', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(card.positive),
                        const Text('Negative', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(card.negative)
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
          
        ],
      );
    });
  }
}