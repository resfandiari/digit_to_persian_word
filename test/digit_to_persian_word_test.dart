import 'package:flutter_test/flutter_test.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';

void main() {
  test('adds one to input values', () {

    expect(DigitToWord.toWord( "1",StrType.NumWord), "1");
    expect(DigitToWord.toWord( "1",StrType.NumWord,isMoney: true), "1 تومان");
    expect(DigitToWord.toWord( "1",StrType.StrWord,isMoney: true), "یک تومان");
    expect(DigitToWord.toWord( "123,456,789",StrType.NumWord,separator: ","), "123 میلیون و456 هزار و789");
    expect(DigitToWord.toWord( "123.456.789",StrType.NumWord,separator: "."), "123 میلیون و456 هزار و789");
    expect(DigitToWord.toWord( "12.5",StrType.NumWord), "فرمت ورودی اشتباه است.");
    expect(DigitToWord.toWord( "123456",StrType.StrWord), 'صد و بیست و سه هزار و چهارصد و پنجاه و شش');
    expect(DigitFormat.convert( "123456"), "123,456");
    expect(DigitToWord.toWord( "0",StrType.NumWord), "صفر");
    expect(DigitToWord.toWord("",StrType.NumWord), '');
    expect(DigitToWord.toWord(null,StrType.NumWord), '');
  });
}

