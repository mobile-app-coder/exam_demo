import 'dart:async';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:exam_demo/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardAddPage extends StatefulWidget {
  const CardAddPage({super.key});

  @override
  State<CardAddPage> createState() => _CardAddPageState();
}

class _CardAddPageState extends State<CardAddPage> {
  var cardNumberMask = new MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var expireDateMask = new MaskTextInputFormatter(
      mask: '##/##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  CardModel cardModel = CardModel("", "");

  backToCardsPage() {
    Map<String, CardModel> map = {"data": cardModel};
    Navigator.of(context).pop(map);
  }

  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

  Future<void> scanCard() async {
    final CardDetails? cardDetails =
        await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted || cardDetails == null) return;
    setState(() {
      _cardDetails = cardDetails;
      cardModel.expireDate = cardDetails.expiryDate;
      cardModel.cardNumber = cardDetails.cardNumber;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //card
            AspectRatio(
              aspectRatio: 2.2 / 1.22,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/im_card_bg.png"),
                )),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            cardModel.cardType() ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          //$card number
                          Text(
                            cardModel.cardNumber,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          //#exprire date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "VALID\nTHRU",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                cardModel.expireDate,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),
            //enter elements
            Text(
              "Enter expiration date",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            //card number textfield
            TextField(
              maxLength: 19,
              style: TextStyle(fontSize: 25),
              inputFormatters: [cardNumberMask],
              onChanged: (text) {
                setState(() {
                  cardModel.cardNumber = text;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: cardModel.cardNumber,
                  suffixIcon: GestureDetector(
                onTap: () async{
                  scanCard();
                },
                child: Icon(Icons.document_scanner_outlined),
              )),
            ),

            //expiration date textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: TextField(

                    maxLength: 5,
                    style: TextStyle(fontSize: 35),
                    inputFormatters: [expireDateMask],
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        cardModel.expireDate = text;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: cardModel.expireDate
                    ),
                  ),
                )
              ],
            ),

            Expanded(child: Container()),
            //save button
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () {
                  //scanCard();
                  backToCardsPage();
                },
                textColor: Colors.white,
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
