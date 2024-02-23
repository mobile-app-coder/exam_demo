import 'package:exam_demo/models/card_model.dart';
import 'package:exam_demo/pages/card_add_page.dart';
import 'package:flutter/material.dart';

class CardsListPage extends StatefulWidget {
  const CardsListPage({super.key});

  @override
  State<CardsListPage> createState() => _CardsListPageState();
}

class _CardsListPageState extends State<CardsListPage> {
  var cards = [
    CardModel("5272892091839232", "1126", "assets/images/ic_card_master.png"),
    CardModel("5272892091839232", "1126", "assets/images/ic_card_master.png"),
    CardModel("5272892091839232", "1126", "assets/images/ic_card_master.png"),
  ];

  goCardAddPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext contex) {
          return CardAddPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card List"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: ListView(
                children: [
                  cardItem(
                    CardModel("5272892091839232", "1126",
                        "assets/images/ic_card_master.png"),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {
                  goCardAddPage();
                },
                child: Text(
                  "Add card",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardItem(CardModel model) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              model.cardImage,
            ),
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "**** **** **** 9275",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "11/25",
                style: TextStyle(fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
