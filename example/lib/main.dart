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
  final double areaHeight = 500;
  final double areaWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resizable Widget'),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
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
                dragWidgetsList: List.generate(
                  9,
                  (index) => DragWidget(
                    child: Container(color: Colors.blue.withOpacity(0.4)),
                    onDragType: DragDetailsTypes.types[index],
                    height: 15,
                    width: 15,
                  ),
                ),
                areaHeight: areaHeight,
                areaWidth: areaWidth,
                height: areaHeight / 2,
                width: areaWidth / 2,
                minWidth: 50,
                minHeight: 50,
                dragWidgetsArea: Size(areaWidth + 15, areaHeight + 15),
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
      }),
    );
  }
}
