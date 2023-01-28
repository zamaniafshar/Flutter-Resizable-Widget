## ℹ️ About
#### A Flutter widget that allow user to resize or move it's child in the screen by dragging.

## Preview


https://user-images.githubusercontent.com/88077166/215252550-b57330ef-b9d9-49c6-8642-f53cac1d4359.mp4

## Sample
``` dart
Scaffold(
      appBar: AppBar(
        title: const Text('First Example'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          double areaHeight = constraint.maxHeight * 0.8;
          double areaWidth = constraint.maxWidth * 0.8;

          return Container(
            width: constraint.maxWidth,
            height: constraint.maxHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lightBlue.shade200,
                  Colors.blue.shade700,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Widget Area',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: constraint.maxHeight * 0.8,
                  width: constraint.maxWidth * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: ResizableWidget(
                    areaHeight: areaHeight,
                    areaWidth: areaWidth,
                    height: 250,
                    width: 250,
                    minHeight: 100,
                    minWidth: 100,
                    dragWidgetsArea: const Size.square(30 / 2),
                    triggersList: DragTriggersEnum.values
                        .map(
                          (e) => Trigger(
                            dragTriggerType: e,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Colors.white38,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              3,
                              (index) => const Divider(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              3,
                              (index) => const VerticalDivider(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    ```
