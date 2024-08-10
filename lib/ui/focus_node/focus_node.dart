import 'package:flutter/material.dart';
import 'package:focus_node/utils/utils.dart';

class FocusNodeScreen extends StatefulWidget {
  const FocusNodeScreen({super.key});

  @override
  State<FocusNodeScreen> createState() => _FocusNodeScreenState();
}

class _FocusNodeScreenState extends State<FocusNodeScreen> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus Node"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: focusNode1,
              onSubmitted: (value) {
                MyUtils.fieldFocusChange(context, focusNode1, focusNode2);
                print(value);
              },
            ),
            TextField(
              focusNode: focusNode2,
              onSubmitted: (value) {
                MyUtils.fieldFocusChange(context, focusNode2, focusNode3);
                print(value);
              },
            ),
            TextField(
              onSubmitted: (value) {
                focusNode3.unfocus();
                print(value);
              },
              focusNode: focusNode3,
            ),
          ],
        ),
      ),
    );
  }
}
