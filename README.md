# flutter_intro_screen

A new Flutter package for both android and iOS which helps developers in creating animated walkthrough of their app.

## Screenshots

<img src="ss1.png" height="300em" /> 

<img src="ss2.png" height="300em" />

## Usage

[Example](https://github.com/iampawan/Flutter-Walkthrough/blob/master/example/example_app.dart)

To use this package :

* add the dependency to your [pubspec.yaml](https://github.com/iampawan/Flutter-Walkthrough/blob/master/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    flutter_walkthrough:
```

### How to use

```dart
class TestScreen extends StatelessWidget {
  
  /*here we have a list of walkthroughs which we want to have, 
  each walkthrough have a title,content and an icon.
  */
  final List<Walkthrough> list = [
    Walkthrough(
      title: "Title 1",
      content: "Content 1",
      imageIcon: Icons.restaurant_menu,
    ),
    Walkthrough(
      title: "Title 2",
      content: "Content 2",
      imageIcon: Icons.search,
    ),
    Walkthrough(
      title: "Title 3",
      content: "Content 3",
      imageIcon: Icons.shopping_cart,
    ),
    Walkthrough(
      title: "Title 4",
      content: "Content 4",
      imageIcon: Icons.verified_user,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //here we need to pass the list and the route for the next page to be opened after this.
    return new IntroScreen(
      list,
      new MaterialPageRoute(builder: (context) => new TestScreen()),
    );
  }
}
```
