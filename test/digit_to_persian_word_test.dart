import 'package:flutter_test/flutter_test.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';

void main() {
  test('adds one to input values', () {

    expect(DigitToWord.change(digit: "1"), "1 تومان");
    expect(DigitToWord.change(digit: "123,456,789"), "123 میلیون و 456 هزار و 789 تومان");
    expect(DigitToWord.change(digit: "123.456.789",regExp: "."), "123 میلیون و 456 هزار و 789 تومان");
    expect(DigitToWord.change(digit: "0"), "the first num must not be 0");
    expect(DigitToWord.change(digit: "123"), "the first num must not be 0");
    expect(() => DigitToWord.change(digit:null), throwsNoSuchMethodError);
  });
}

