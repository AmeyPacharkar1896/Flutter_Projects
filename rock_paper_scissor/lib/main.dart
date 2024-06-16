import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/rock_paper_scissor_state.dart';

void main() {
  runApp(const RockPaperScissor());
}

class RockPaperScissor extends StatelessWidget {
  const RockPaperScissor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rock Paper Scissor Game'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        body: const RockPaperScissorBody(),
      ),
    );
  }
}


//wellfound, intershalla, linkdin, unstop, bluelearn