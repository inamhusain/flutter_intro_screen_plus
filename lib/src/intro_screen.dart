part of flutter_intro_screen_plus;

class IntroScreen extends StatefulWidget {
  final List<IntroCardWidget> walkthroughList;
  final MaterialPageRoute pageRoute;
  const IntroScreen(
      {Key? key, required this.walkthroughList, required this.pageRoute})
      : super(key: key);

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.walkthroughList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Spacer(),
          Expanded(
            flex: 3,
            child: PageView(
              scrollBehavior:
                  const ScrollBehavior().copyWith(overscroll: false),
              controller: controller,
              onPageChanged: _onPageChanged,
              children: widget.walkthroughList,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(lastPage ? "" : "SKIP",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? null
                      : widget.skipPage(
                          context,
                        ),
                ),
                TextButton(
                  child: Text(lastPage ? "GOT IT" : "NEXT",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? widget.skipPage(context)
                      : controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
