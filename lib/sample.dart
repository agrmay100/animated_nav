import 'dart:math';

import 'package:flutter/material.dart';

class SampleWidget extends StatefulWidget {
  const SampleWidget({Key? key}) : super(key: key);

  @override
  State<SampleWidget> createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
  static const _duration = Duration(milliseconds: 200);

  late Color color;
  late double borderRadius;
  late bool expand;

  @override
  initState() {
    super.initState();
    expand = false;
  }

  void change() {
    setState(() {
      expand = true;
    });
  }

  void unChange() {
    setState(() {
      expand = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedContainer(
                          height: 50,
                          width: 100,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: _duration,
                          curve: Curves.easeInOutBack,
                        ),
                        AnimatedScale(
                          duration: _duration,
                          scale: expand ? 2 : 1.5,
                          curve: Curves.easeOutBack,
                          child: AnimatedSlide(
                            duration: _duration,
                            curve: Curves.easeOutBack,
                            offset: Offset(0, expand ? -0.40 : 0),
                            child: const Icon(Icons.access_alarms_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedContainer(
                          height: 50,
                          width: 100,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: _duration,
                          curve: Curves.easeInOutBack,
                        ),
                        AnimatedScale(
                          duration: _duration,
                          scale: expand ? 2 : 1.5,
                          curve: Curves.easeOutBack,
                          child: AnimatedSlide(
                            duration: _duration,
                            curve: Curves.easeOutBack,
                            offset: Offset(0, expand ? -0.40 : 0),
                            child: const Icon(Icons.access_alarms_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedContainer(
                          height: 50,
                          width: 100,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: _duration,
                          curve: Curves.easeInOutBack,
                        ),
                        AnimatedScale(
                          duration: _duration,
                          scale: expand ? 2 : 1.5,
                          curve: Curves.easeOutBack,
                          child: AnimatedSlide(
                            duration: _duration,
                            curve: Curves.easeOutBack,
                            offset: Offset(0, expand ? -0.40 : 0),
                            child: const Icon(Icons.access_alarms_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedContainer(
                          height: 50,
                          width: 100,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: _duration,
                          curve: Curves.easeInOutBack,
                        ),
                        AnimatedScale(
                          duration: _duration,
                          scale: expand ? 2 : 1.5,
                          curve: Curves.easeOutBack,
                          child: AnimatedSlide(
                            duration: _duration,
                            curve: Curves.easeOutBack,
                            offset: Offset(0, expand ? -0.40 : 0),
                            child: const Icon(Icons.access_alarms_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('change'),
              onPressed: () => change(),
            ),
            ElevatedButton(
              child: const Text('uncchange'),
              onPressed: () => unChange(),
            ),
          ],
        ),
      ),
    );
  }
}
