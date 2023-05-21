import 'package:flutter/material.dart';
import 'package:tarot/screens/three_card.dart';
import 'package:tarot/screens/types.dart';
import 'package:tarot/screens/one_card.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:tarot/classes/tarot_card.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(cards: await deckBuilder()));
}

class MyApp extends StatelessWidget {
  final List<TarotCard> cards;
  const MyApp({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => Types(cards: cards,),
        '/one_card':(context) => OneCard(cards: cards,), 
        '/three_card':(context) => ThreeCard(cards: cards,)
      },
    );
  }
}

Future<List<TarotCard>> deckBuilder() async {
  String jsonString = await rootBundle.loadString('assets/json/cards.json');
  List<dynamic> jsonList = json.decode(jsonString)['cards'];
  List<TarotCard> cards = [];
  for (var jsonCard in jsonList) {
    TarotCard tarotCard = TarotCard(
      name: jsonCard['name'],
      description: jsonCard['description'],
      positive: jsonCard['positive'],
      negative: jsonCard['negative'],
      imagePath: jsonCard['image_path']
    );

    cards.add(tarotCard);
  }
  
  return cards;
}