import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: -5).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.forward();
                Future.delayed(const Duration(milliseconds: 200), () {
                  controller.reverse();
                });
              },
              child: Stack(
                children: [
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Click to pop",
                        style: TextStyle(color: Colors.transparent),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset:
                        Offset((1 - animation.value), (1 - animation.value)),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("Click to pop"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
