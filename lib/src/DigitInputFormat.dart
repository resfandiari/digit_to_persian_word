import 'package:flutter/services.dart';

/// Format incoming numeric text to fit the format of ###,###,###,###...
class DigitInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue, {String separator = ","}) {
        //remove ',' symbol of text
    String number = newValue.text.replaceAll(RegExp(','), '');
    String str = "";
    for (var i = number.length; i > 0;) {
      if (i > 3)
        str = separator + number.substring(i - 3, i) + str;
      else
        str = number.substring(0, i) + str;
      i = i - 3;
    }
    return newValue.copyWith(
        text: str,
        selection: new TextSelection.collapsed(offset: str.length));
  }
}
