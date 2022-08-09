import 'package:flutter/material.dart';
import 'package:resizable_widget/src/resizable_widget_controller.dart';
import 'package:resizable_widget/src/resizable_widget.dart';
import 'package:resizable_widget/src/final_size.dart';

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
    final controller = ResizableWidgetController(
      FinalSize(
        initialPosition: Offset(areaWidth / 2, areaHeight / 2),
        areaHeight: areaHeight,
        areaWidth: areaWidth,
        height: areaHeight / 2,
        width: areaWidth / 2,
        minWidth: 50,
        minHeight: 50,
      ),
    );
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
                
                controller: controller,
                dragWidgetsArea: Rect.,
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
