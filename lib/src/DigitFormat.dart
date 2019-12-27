/// Format incoming numeric text to fit the format of ###,###,###,###...
class DigitFormat {
  static String convert(String number, {String separator = ","}) {
    String str = "";
    for (var i = number.length; i > 0;) {
      if (i > 3)
        str = separator + number.substring(i - 3, i) + str;
      else
        str = number.substring(0, i) + str;
      i = i - 3;
    }
    return str;
  }
}
