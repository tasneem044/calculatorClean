import 'package:calculatorclean/domain/entites/cal_button_info.dart';
import 'package:calculatorclean/presentaion/widgets/main_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List<CalButton> calNumbers = [
  CalButton(
      number: "AC",
      btnColor: Colors.grey,
      textColor: Colors.black,
      intNumb: 30),
  CalButton(
      number: "+/-",
      btnColor: Colors.grey,
      textColor: Colors.black,
      intNumb: 40),
  CalButton(
      number: "%", btnColor: Colors.grey, textColor: Colors.black, intNumb: 50),
  CalButton(number: "/", intNumb: 60),
  CalButton(
    number: "7",
    intNumb: 7,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "8",
    intNumb: 8,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "9",
    intNumb: 9,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(number: "X", intNumb: 70),
  CalButton(
    number: "6",
    intNumb: 6,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "5",
    intNumb: 5,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "4",
    intNumb: 4,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    intNumb: 80,
    number: "-",
  ),
  CalButton(
    number: "3",
    intNumb: 3,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "2",
    intNumb: 2,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "1",
    intNumb: 1,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(number: "+", intNumb: 90),
  CalButton(
    number: "",
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: ".",
    intNumb: 100,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "0",
    intNumb: 0,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(number: "=", intNumb: 20),
];

class _MainPageState extends State<MainPage> {
  String stringResultNum = "0";
  int firstNumberCal = 0;
  int numbResult = 0;
  List<String> mainNumberList = [];
  int i = 0;
  String fullString = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                fullString,
                style: TextStyle(fontSize: 30),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: MainText(
                    numText: stringResultNum,
                  )),
              Expanded(
                child: Container(
                  child: GridView.builder(
                      itemCount: calNumbers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            int numberInt = calNumbers[index].intNumb;
                            onTabFun(numberInt);
                          },
                          child: Container(
                            height: 25,
                            decoration: BoxDecoration(
                                color: calNumbers[index].btnColor,
                                shape: BoxShape.circle),
                            margin: EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                calNumbers[index].number,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: calNumbers[index].textColor),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ]),
      ),
    );
  }

  onTabFun(int numb) {
    //if intialy here
    if (numb >= 0 && numb <= 9 ) {
      // stringStaus(numb);
      int.parse(stringResultNum) == 0
          ? stringResultNum = numb.toString()
          : stringResultNum = stringResultNum + numb.toString();
      setState(() {
        stringResultNum;
        print("the number is :: $numb");
        //
      });
    } else {
      mainNumberList.add(stringResultNum);
    }

    //for (int f = 0; numb >= 0 && numb <= 9; f++) {}

    if (numb != 20) {
      switch (numb) {
        case 30: //AC
          {
            stringResultNum = "0";
            setState(() {
              firstNumberCal = 0;
              numbResult = 0;
              fullString = " ";
              mainNumberList = [];
            });
          }
          break;
        case 90: //summation
          {
            mainNumberList.add("+");
            screenPar("+");
            stringResultNum = "0";
            // stringStaus(numb);
            // print("length : ${mainNumberList.length}");
          }
          break;
        case 80:
          {
            mainNumberList.add("-");
            screenPar("-");
            stringResultNum = "0";
          }
          break;
        case 70:
          {
            mainNumberList.add("X");
            screenPar("X");
            stringResultNum = "0";
          }
          break;
        case 60:
          {
            mainNumberList.add("/");
            screenPar("/");
            stringResultNum = "0";
          }
          break;
        case 50:
          {
            mainNumberList.add("%");
            screenPar("%");
            stringResultNum = "0";
          }
          break;
        case 40:
          {
            setState(() {
              stringResultNum = (int.parse(stringResultNum) * -1).toString();
            });
          }
          break;
        default:
          {}
          break;
      }
    } else //if it equal entered
    {
      mainNumberList.add("=");
      screenPar("=");
      print(mainNumberList);
      for (int j = 0; j < (mainNumberList.length - 1); j++) {
        switch (mainNumberList[j]) {
          case "+":
            {
              int z = int.parse(mainNumberList[j - 1]) +
                  int.parse(mainNumberList[j + 1]);
              mainNumberList[j + 1] = z.toString();
              if (kDebugMode) {
                print(" z = $z");
              }
              stringResultNum = z.toString();
            }
            break;
          case "-":
            {
              int y = int.parse(mainNumberList[j - 1]) -
                  int.parse(mainNumberList[j + 1]);
              mainNumberList[j + 1] = y.toString();

              print("-");
              print(" y = $y");
              stringResultNum = y.toString();
            }
            break;
          case "X":
            {
              int t = int.parse(mainNumberList[j - 1]) *
                  int.parse(mainNumberList[j + 1]);
              mainNumberList[j + 1] = t.toString();
              print("*");
              print("t = $t");
              stringResultNum = t.toString();
            }
            break;
          case "/":
            {
              double s = (int.parse(mainNumberList[j - 1]) /
                  int.parse(mainNumberList[j + 1]));
              int v = s.toInt();
              mainNumberList[j + 1] = v.toString();
              print("/");
              print("s = $s");
              stringResultNum = v.toString();
            }
            break;
          case "%":
            {
              int u = int.parse(mainNumberList[j - 1]) %
                  int.parse(mainNumberList[j + 1]);
              mainNumberList[j + 1] = u.toString();
              print("%");
              print("u = $u");
              stringResultNum = u.toString();
              //firstNumberCal = u;
            }
            break;
            // case "=":
            //   {
            //     stringResultNum;
            //
            //     print("equaaaaaaaaaaaaaal");
            //   }
            break;
          default:
            {
              print(" equal / length : ${mainNumberList.length}");
              // firstNumberCal = y;
              //fullString = fullString + stringResultNum;
            }
        }
      }
    }
  }

  screenPar(String sym) {
    // stringResultNum="0";
    //fullString = stringResultNum;
    setState(() {
//      stringResultNum = firstNumberCal.toString();
      fullString = fullString + stringResultNum + sym;
      // numbResult = 0;
    });
  }

// printList() {
//   setState(() {
//     mainNumberList.add(stringResultNum);
//   });
//
//   print(mainNumberList[i]);
//   print("string = $stringResultNum");
// }
}
