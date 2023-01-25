import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resizable Widget'),
      ),
      body: FirstExample(),
    );
  }
}

class FirstExample extends StatelessWidget {
  const FirstExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double areaHeight = constraint.maxHeight * 0.8;
        double areaWidth = constraint.maxWidth * 0.8;

        return Container(
          width: constraint.maxWidth,
          height: constraint.maxHeight,
          color: Colors.black,
          child: UnconstrainedBox(
            child: Container(
              width: areaWidth,
              height: areaHeight,
              alignment: Alignment.center,
              color: Colors.red,
              child: ResizableWidget(
                areaHeight: areaHeight,
                areaWidth: areaWidth,
                height: areaHeight / 2,
                width: areaWidth / 2,
                // minWidth: 50,
                // minHeight: 50,
                dragWidgetsArea: const Size(15, 15),
                triggersList: List.generate(
                  9,
                  (index) => Trigger(
                    height: 30,
                    width: 30,
                    dragTriggerType: DragTriggersEnum.values[index],
                    child: Container(
                      color: Colors.blue.withOpacity(0.4),
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Center(child: Text('go to next screen')),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('second screen'),
      ),
    );
  }
}

class SecondExample extends StatelessWidget {
  const SecondExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double areaHeight = constraint.maxHeight * 0.8;
        double areaWidth = constraint.maxWidth * 0.8;

        return Container(
          width: constraint.maxWidth,
          height: constraint.maxHeight,
          color: Colors.black,
          child: UnconstrainedBox(
            child: Container(
              width: areaWidth,
              height: areaHeight,
              alignment: Alignment.center,
              color: Colors.red,
              child: ResizableWidget(
                areaHeight: areaHeight,
                areaWidth: areaWidth,
                height: areaHeight / 2,
                width: areaWidth / 2,
                minWidth: 50,
                minHeight: 50,
                dragWidgetsArea: const Size(15, 15),
                triggersList: List.generate(
                    9,
                    (index) => Trigger(
                          height: 30,
                          width: 30,
                          dragTriggerType: DragTriggersEnum.topLeft,
                          child: Container(
                            color: Colors.blue.withOpacity(0.4),
                          ),
                        )),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
