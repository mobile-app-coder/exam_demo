class CardModel {
  String cardNumber;
  String expireDate;

  CardModel(this.cardNumber, this.expireDate);





  String cardImage() {
    if (cardNumber.startsWith("5257")) {
      return "assets/images/ic_card_master.png";
    } else if (cardNumber.startsWith("3432")) {
      return "assets/images/ic_card_visa.png";
    } else {
      return "assets/images/ic_card_visa.png";
    }
  }

  String? cardType() {
    if (cardNumber.startsWith("5257")) {
      return "Mastercard".toUpperCase();
    }

    if (cardNumber.startsWith("3432")) {
      return "Visa".toUpperCase();
    }
    return "Other";
  }
}
