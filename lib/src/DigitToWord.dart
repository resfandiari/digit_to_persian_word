enum StrType { NumWord, StrWord }

class DigitToWord {
  static String toWord(String number, StrType type,
      {String separator: ',',
        bool isMoney: false,
        String biggerThanCapacity: "طول عدد باید کمتر از 16 رقم باشد."}) {

    String _words = "";
    String _result = "";


    if (number == null || number == "") {
      return '';
    }
    if (number.length >= 15) {
      return biggerThanCapacity;
    }

    ///remove separator ','  symbol of text
    String numInt = number.replaceAll(separator, '');

    switch (type) {
      case StrType.NumWord:
        _words = _NumWord.toWord(numInt, isMoney);
        break;
      case StrType.StrWord:
        _words = _StrWord.toWord(numInt, isMoney);
        break;
    }

    _result = _words.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");

    return _result.trim();
  }
}


class _NumWord {
  static String toWord(String inputNumber, bool isMoney) {
    try {
      int number = int.parse(inputNumber);
      if (number == 0) {
        return "صفر";
      }
      String fullNumber = inputNumber;
      for (var i = 0; i < 15 - fullNumber.length; i++) {
        inputNumber = "0" + inputNumber;
      }
      fullNumber = inputNumber;

      int trillion = int.parse(fullNumber.substring(0, 3));
      int billions = int.parse(fullNumber.substring(3, 6));
      int millions = int.parse(fullNumber.substring(6, 9));
      int hundredThousands = int.parse(fullNumber.substring(9, 12));
      int thousands = int.parse(fullNumber.substring(12, 15));

      String checkTrillion;

      switch (trillion) {
        case 0:
          checkTrillion = "";
          break;
        default:
          checkTrillion = "$trillion" + " تریلیون و";
      }
      String result = checkTrillion;

      String checkBillions;

      switch (billions) {
        case 0:
          checkBillions = "";
          break;
        default:
          checkBillions = "$billions" + " میلیارد و";
      }
      result += checkBillions;

      String checkMillions;

      switch (millions) {
        case 0:
          checkMillions = "";
          break;
        default:
          checkMillions = "$millions" + " میلیون و";
      }
      result = result + checkMillions;

      String checkHundredThousands;
      switch (hundredThousands) {
        case 0:
          checkHundredThousands = "";
          break;
        default:
          checkHundredThousands = "$hundredThousands" + " هزار و";
      }
      result = result + checkHundredThousands;

      if (thousands == 0 && result.endsWith(" و")) {
        result = result.substring(0, result.length - 2);
      }
      String checkThousand;
      switch (thousands) {
        case 0:
          checkThousand = "";
          break;
        default:
          checkThousand = "$thousands";
      }

      result = result + "$checkThousand";

      return isMoney ? result + " تومان" : result;
    } on FormatException catch (e) {
      print(e.toString());
      return "فرمت ورودی اشتباه است.";
    }
  }
}

class _StrWord {
  static String toWord(String inputNumber, bool isMoney) {
    try {
      int number = int.parse(inputNumber);
      if (number == 0) {
        return "صفر";
      }
      String fullNumber = inputNumber;
      for (var i = 0; i < 15 - fullNumber.length; i++) {
        inputNumber = "0" + inputNumber;
      }
      fullNumber = inputNumber;

      int trillion = int.parse(fullNumber.substring(0, 3));
      int billions = int.parse(fullNumber.substring(3, 6));
      int millions = int.parse(fullNumber.substring(6, 9));
      int hundredThousands = int.parse(fullNumber.substring(9, 12));
      int thousands = int.parse(fullNumber.substring(12, 15));

      String checkTrillion;

      switch (trillion) {
        case 0:
          checkTrillion = "";
          break;
        case 1:
          checkTrillion = _convertNum(trillion) + " تریلیون ";
          break;
        default:
          checkTrillion = _convertNum(trillion) + " تریلیون و";
      }
      String result = checkTrillion;

      String checkBillions;

      switch (billions) {
        case 0:
          checkBillions = "";
          break;
        default:
          checkBillions = _convertNum(billions) + " میلیارد و";
      }
      result += checkBillions;

      String checkMillions;

      switch (millions) {
        case 0:
          checkMillions = "";
          break;
        default:
          checkMillions = _convertNum(millions) + " میلیون و";
      }
      result = result + checkMillions;

      String checkHundredThousands;
      switch (hundredThousands) {
        case 0:
          checkHundredThousands = "";
          break;
        case 1:
          checkHundredThousands = "هزار و";
          break;
        default:
          checkHundredThousands =
              _convertNum(hundredThousands) + " هزار و";
      }
      result = result + checkHundredThousands;

      String checkThousand;
      checkThousand = _convertNum(thousands);
      result = result + checkThousand;

      if (result.endsWith(" و")) {
        result = result.substring(0, result.length - 2);
      }

      return isMoney ? result + " تومان" : result;
    } on FormatException catch (e) {
      print(e.toString());
      return "فرمت ورودی اشتباه است.";
    }
  }

  static String _convertNum(int number) {
    List<String> tensNames = [
      "",
      " ده و",
      " بیست و",
      " سی و",
      " چهل و",
      " پنجاه و",
      " شصت و",
      " هفتاد و",
      " هشتاد و",
      " نود و"
    ];

    List<String> numNames = [
      "",
      " یک",
      " دو",
      " سه",
      " چهار",
      " پنج",
      " شش",
      " هفت",
      " هشت",
      " نه",
      " ده",
      " یازده",
      " دوازده",
      " سیزده",
      " چهارده",
      " پانزده",
      " شانزده",
      " هفده",
      " هجده",
      " نوزده"
    ];

    List<String> thousandsNames = [
      "",
      " صد و",
      " دویست و",
      " سیصد و",
      " چهارصد و",
      " پانصد و",
      " ششصد و",
      " هفتصد و",
      " هشتصد و",
      " نهصد و"
    ];
    String soFar;
    if (number % 100 < 20) {
      soFar = numNames[number % 100];
      number = number ~/ 100;
    } else {
      soFar = numNames[number % 10];
      number = number ~/ 10;
      soFar = tensNames[number % 10] + soFar;
      number = number ~/ 10;
    }
    if (number == 0) {
      if (soFar.endsWith(" و")) {
        soFar = soFar.substring(0, soFar.length - 2);
      }
      return soFar;
    }
    var str = "";
    str = (thousandsNames[number] + soFar);
    if (str.endsWith(" و") || str.endsWith("و ")) {
      str = str.substring(0, str.length - 2);
    }
    return str;
  }
}
