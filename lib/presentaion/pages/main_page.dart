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

onTabFun() {}
List<CalButton> calNumbers = [
  CalButton(
      number: "AC",
      onTab: onTabFun,
      btnColor: Colors.grey,
      textColor: Colors.black),
  CalButton(
      number: "+/-",
      onTab: onTabFun,
      btnColor: Colors.grey,
      textColor: Colors.black),
  CalButton(
      number: "%",
      onTab: onTabFun,
      btnColor: Colors.grey,
      textColor: Colors.black),
  CalButton(number: "/", onTab: onTabFun),
  CalButton(
    number: "7",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "8",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "9",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(number: "X", onTab: onTabFun),
  CalButton(
    number: "6",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "5",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "4",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(number: "-", onTab: onTabFun),
  CalButton(
    number: "3",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "2",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "1",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(number: "+", onTab: onTabFun),
  CalButton(
    number: "",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: ".",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),
  CalButton(
    number: "0",
    onTab: onTabFun,
    btnColor: Colors.grey.shade800,
  ),


  CalButton(number: "=", onTab: onTabFun),

];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
          SizedBox(
            height: 100,
          ),
          Align(alignment: Alignment.topRight, child: MainText()),
          Expanded(
            child: Container(
              child: GridView.builder(
                  itemCount: calNumbers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return
                      GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                            color: calNumbers[index].btnColor,
                            shape: BoxShape.circle),
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            calNumbers[index].number.toString(),
                            style: TextStyle(
                                fontSize: 30, color: calNumbers[index].textColor),
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
}
