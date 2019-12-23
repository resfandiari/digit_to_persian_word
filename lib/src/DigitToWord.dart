import 'package:flutter/material.dart';

///This class is for convert digit to persian word
///  ex: DigitToWord.change(digit: "123,456,789") => 123 میلیون و 456 هزار و 789 تومان
///  ex: DigitToWord.change(digit: "123.456.789",regExp:".") => 123 میلیون و 456 هزار و 789 تومان
class DigitToWord {
  static change(
      {@required String digit,
      String regExp: ',',
      String emptyMessage: "",
      String biggerThanCapacity: "digit lenght must be less than 14"}) {
    ///variable
    final String onesAnd = " تومان";
    final String thousandsAnd = " هزار و ";
    final String thousandsCom = " هزار تومان ";
    final String millionsAnd = " میلیون و ";
    final String millionsCom = " میلیون تومان ";
    final String billionsAnd = " میلیارد و ";
    final String billionsCom = " میلیارد تومان";

    ///if the first num be 0
    if (digit != null && digit.length != 0 && digit[0] == "0")
      return "the first num must not be 0";

    ///remove ',' symbol of text
    String numInt = digit.replaceAll(regExp, '');

    ///length numInt
    int length = numInt.length;
    String word = "";
    switch (length) {
      case 0:
        word = emptyMessage;
        break;
      case 1:
      case 2:
      case 3:
        word = numInt + onesAnd;
        break;
      case 4:
      case 5:
      case 6:
        if (numInt.substring(length - 3, length).contains("000")) {
          word = numInt.substring(0, length - 3) + thousandsCom;
        } else if (numInt.substring(length - 3, length - 1).contains("00")) {
          word = numInt.substring(0, length - 3) +
              thousandsAnd +
              numInt[length - 1] +
              onesAnd;
        } else if (numInt.substring(length - 3, length - 2).contains("0")) {
          word = numInt.substring(0, length - 3) +
              thousandsAnd +
              numInt.substring(length - 2, length) +
              onesAnd;
        } else {
          word = numInt.substring(0, length - 3) +
              thousandsAnd +
              numInt.substring(length - 3, length) +
              onesAnd;
        }
        break;
      case 7:
      case 8:
      case 9:
        if (numInt.substring(length - 6, length - 3).contains("000")) {
          if (numInt.substring(length - 3, length).contains("000")) {
            word = (numInt.substring(0, length - 6) + millionsCom);
          } else if (numInt.substring(length - 3, length - 1).contains("00")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 1, length) +
                onesAnd);
          } else if (numInt.substring(length - 3, length - 2).contains("0")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 2, length) +
                onesAnd);
          } else {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 3, length) +
                onesAnd);
          }
        } else if (numInt.substring(length - 6, length - 4).contains("00")) {
          if (numInt.substring(length - 3, length).contains("000")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 4, length - 3) +
                thousandsCom);
          } else if (numInt.substring(length - 3, length - 1).contains("00")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 4, length - 3) +
                thousandsAnd +
                numInt.substring(length - 1, length) +
                onesAnd);
          } else if (numInt.substring(length - 3, length - 2).contains("0")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 4, length - 3) +
                thousandsAnd +
                numInt.substring(length - 2, length) +
                onesAnd);
          } else {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 4, length - 3) +
                thousandsAnd +
                numInt.substring(length - 3, length) +
                onesAnd);
          }
        } else if (numInt.substring(length - 6, length - 5).contains("0")) {
          if (numInt.substring(length - 3, length).contains("000")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 5, length - 3) +
                thousandsCom);
          } else if (numInt.substring(length - 3, length - 1).contains("00")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 5, length - 3) +
                thousandsAnd +
                numInt.substring(length - 1, length) +
                onesAnd);
          } else if (numInt.substring(length - 3, length - 2).contains("0")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 5, length - 3) +
                thousandsAnd +
                numInt.substring(length - 2, length) +
                onesAnd);
          } else {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 5, length - 3) +
                thousandsAnd +
                numInt.substring(length - 3, length) +
                onesAnd);
          }
        } else {
          if (numInt.substring(length - 3, length).contains("000")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 6, length - 3) +
                thousandsCom);
          } else if (numInt.substring(length - 3, length - 1).contains("00")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 6, length - 3) +
                thousandsAnd +
                numInt.substring(length - 1, length) +
                onesAnd);
          } else if (numInt.substring(length - 3, length - 2).contains("0")) {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 6, length - 3) +
                thousandsAnd +
                numInt.substring(length - 2, length) +
                onesAnd);
          } else {
            word = (numInt.substring(0, length - 6) +
                millionsAnd +
                numInt.substring(length - 6, length - 3) +
                thousandsAnd +
                numInt.substring(length - 3, length) +
                onesAnd);
          }
        }
        break;

      case 10:
      case 11:
      case 12:
        if (numInt.substring(length - 9, length - 6).contains("000")) {
          if (numInt.substring(length - 6, length - 3).contains("000")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) + billionsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 4).contains("00")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 5).contains("0")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          }
        } else if (numInt.substring(length - 9, length - 7).contains("00")) {
          if (numInt.substring(length - 6, length - 3).contains("000")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 4).contains("00")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 5).contains("0")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 7, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          }
        } else if (numInt.substring(length - 9, length - 8).contains("0")) {
          if (numInt.substring(length - 6, length - 3).contains("000")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 4).contains("00")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 5).contains("0")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 8, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          }
        } else {
          if (numInt.substring(length - 6, length - 3).contains("000")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 4).contains("00")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 4, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else if (numInt.substring(length - 6, length - 5).contains("0")) {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - length - 1) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 5, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          } else {
            if (numInt.substring(length - 3, length).contains("000")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsCom);
            } else if (numInt
                .substring(length - 3, length - 1)
                .contains("00")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 1, length) +
                  onesAnd);
            } else if (numInt.substring(length - 3, length - 2).contains("0")) {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 2, length) +
                  onesAnd);
            } else {
              word = (numInt.substring(0, length - 9) +
                  billionsAnd +
                  numInt.substring(length - 9, length - 6) +
                  millionsAnd +
                  numInt.substring(length - 6, length - 3) +
                  thousandsAnd +
                  numInt.substring(length - 3, length) +
                  onesAnd);
            }
          }
        }
        break;
      default:
        word = biggerThanCapacity;
    }
    return word;
  }
}
