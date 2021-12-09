enum CardCompany {
  visa,
  amex,
}

class Const {
  static const double cardPadding = 15;
  static const String tempCardNumber = "####  ####  ####  ####";
  static const String tempCardName = "";
  static const String tempCardMonth = "01";
  static const String tempCardYear = "2021";
  static const String tempCardCvv = "";

  static const Map cardCompanies = {
    "visa": "^4",
    "amex": "^34|37",
    "unionpay": "^62",
    "discover": "^6",
    "dinersclub": "^30|36|38",
    "mastercard": "^5",
    "troy": "^9792",
    "jcb": "^3"
  };

  static const List<String> expirationDate = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  static const List<String> expirationYear = [
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031",
    "2032"
  ];
}
