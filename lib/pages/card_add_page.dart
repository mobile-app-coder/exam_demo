import 'package:exam_demo/models/card_model.dart';
import 'package:flutter/material.dart';

class CardAddPage extends StatefulWidget {
  const CardAddPage({super.key});

  @override
  State<CardAddPage> createState() => _CardAddPageState();
}

class _CardAddPageState extends State<CardAddPage> {
  CardModel cardModel = CardModel("", "", "");
  late String cardType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Card",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/im_card_bg.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      cardType,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cardModel.cardNumber,
                      style: TextStyle(color: Colors.white, fontSize: 27),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          cardModel.expireDate,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Enter expiration date",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //card
                    Container(
                      height: 50,
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 30),
                        onChanged: (text) {
                          setState(
                            () {
                              cardModel.cardNumber = text;
                              if (cardModel.cardNumber.startsWith("5752")) {
                                cardType = "Visa";
                              }
                              if (cardModel.cardNumber.startsWith("34")) {
                                cardType = "Mastercard";
                              }
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //expiration date
                    Container(
                      height: 50,
                      width: 100,
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 30),
                        onChanged: (text) {
                          setState(() {
                            cardModel.expireDate = text;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
