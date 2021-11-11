# Flutter-Resizable-Widget
A widget that allow user resize the widget with drag
### note: this widget Uses Getx


# Example

https://user-images.githubusercontent.com/88077166/141269909-d883de13-8bda-412b-ba51-45eed9b211af.mp4


```
const double dragWidgetSize = 30;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final areaHeight = Get.height * 0.70;
    final areaWidth = Get.width * 0.70;
    final controller = Get.put(
      ResizableWidgetController(
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ResizableWidget(
                dragWidgetHeight: dragWidgetSize,
                dragWidgetWidth: dragWidgetSize,
                controller: controller,
                dragWidget: Container(
                  height: dragWidgetSize,
                  width: dragWidgetSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white24,
                  ),
                ),
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

```
