import 'package:calculatorclean/domain/entites/cal_button_info.dart';
import 'package:calculatorclean/presentaion/widgets/main_text.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.all(16),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            height: 100,
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
    if (numb != 20) {
      if (numb >= 0 && numb <= 9) {
        int.parse(stringResultNum) == 0
            ? stringResultNum = numb.toString()
            : stringResultNum = stringResultNum + numb.toString();
        mainNumberList.add(stringResultNum);
        setState(() {
          stringResultNum;
          print("the number is :: $numb");
          print(mainNumberList[i]);
        });
      }
      switch (numb) {
        case 30: //AC
          {
            setState(() {
              stringResultNum = "0";
              firstNumberCal = 0;
              numbResult = 0;
              print("i can delete");
            });
          }
          break;
        case 90: //summation
          {
            mainNumberList.add("+");

            setState(() {
              stringResultNum = "0"; //must be review again
              firstNumberCal = 0;
              numbResult = 0;
            });
          }
          break;
      }
    } else //if it equal entered
    {
      for (int x = 0; x < (mainNumberList.length - 1); x++) {
        print("x :: $x , ${mainNumberList[x]}");
      }

      for (int j = 0; j <= (mainNumberList.length - 1); j++) {
        switch (mainNumberList[j]) {
          case "+":
            {
              int z = int.parse(mainNumberList[j - 1]) +
                  int.parse(mainNumberList[j + 1]);
              mainNumberList[j + 1] = z.toString();
              print("+");
              print(" ${mainNumberList[j - 1]},  z = ");
            }
            break;

          default:
            {
              print("i dont have value , j = $j :: ${mainNumberList[j]}");
            }
        }
      }
    }
  }
}
