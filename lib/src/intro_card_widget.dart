// ignore_for_file: prefer_typing_uninitialized_variables

part of flutter_intro_screen_plus;

class IntroCardWidget extends StatefulWidget {
  final title;
  final content;
  final imageIcon;
  final imagecolor;

  const IntroCardWidget(
      {Key? key,
      required this.title,
      required this.content,
      required this.imageIcon,
      this.imagecolor = Colors.redAccent})
      : super(key: key);

  @override
  IntroCardWidgetState createState() {
    return IntroCardWidgetState();
  }
}

class IntroCardWidgetState extends State<IntroCardWidget>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: -250.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeInOut));

    animation?.addListener(() => setState(() {}));

    animationController?.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFEEEEEE),
        boxShadow: [
          BoxShadow(offset: Offset(2, 2), blurRadius: 2, color: Colors.grey)
        ],
      ),
      child: Material(
        animationDuration: const Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(animation?.value, 0.0, 0.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(animation?.value, 0.0, 0.0),
              child: Text(widget.content,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.black)),
            ),
            Icon(
              widget.imageIcon,
              size: 100.0,
              color: widget.imagecolor,
            )
          ],
        ),
      ),
    );
  }
}
