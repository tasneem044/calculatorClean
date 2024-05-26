import 'package:calculatorclean/presentaion/widgets/main_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(
              height: 150,
            ),
            Align(alignment: Alignment.topRight, child: MainText()),
            Container(
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.all(5),
                      color: Colors.blue,
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
