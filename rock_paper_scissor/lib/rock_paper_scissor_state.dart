import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/widgets/option_elevated_button.dart';
import 'package:rock_paper_scissor/widgets/result_print.dart';

class RockPaperScissorBody extends StatefulWidget {
  const RockPaperScissorBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return RockPaperScissorState();
  }
}

class RockPaperScissorState extends State<RockPaperScissorBody> {
  late int computerChoice;
  late bool rock = false, paper = false, scissor = true;
  late String result = 'Please Enter your Choice';
  late String storedResult;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionElevatedButton(
              onTap: () {
                setState(() {
                  //rock = 1, paper = 2, scissor = 3
                  computerChoice = Random().nextInt(3);
                  computerChoice++;
                  if (computerChoice == 3) {
                    result = 'Congratulations you Won!!!';
                  } else {
                    result = 'Too bad computer won!!!';
                  }
                });
              },
              text: 'Rock',
            ),
            OptionElevatedButton(
              onTap: () {
                setState(() {
                  computerChoice = Random().nextInt(3);
                  computerChoice++;
                  //rock = 1, paper = 2, scissor = 3
                  if (computerChoice == 1) {
                    result = 'Congratulations you Won!!!';
                  } else {
                    result = 'Too bad computer won!!!';
                  }
                });
              },
              text: 'Paper',
            ),
            OptionElevatedButton(
              onTap: () {
                setState(() {
                  computerChoice = Random().nextInt(3);
                  computerChoice++;

                  //rock = 1, paper = 2, scissor = 3
                  if (computerChoice == 2) {
                    result = 'Congratulations you Won!!!';
                  } else {
                    result = 'Too bad computer won!!!';
                  }
                });
              },
              text: 'Scissor',
            ),
          ],
        ),
        Text(result),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (content, index) {
            return const ListTile(
              title: ResultPrint(),
            );
          },
        )
      ],
    );
  }
}
