import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class home extends StatefulWidget {
  // Add this attribute
  @override
  // ignore: library_private_types_in_public_api
  _homeState createState() => _homeState();
}

var loadingPercentage = 0;

// ignore: camel_case_types
class _homeState extends State<home> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              centerTitle: true,
              // ignore: prefer_const_constructors
              title: Image.asset(
                'images/logotitle.png',
                width: 130,
                height: 130,
              ),
            ),
            body: Stack(
              children: [
                WebView(
                  initialUrl: 'https://liveegy.com/',
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageStarted: (url) {
                    setState(() {
                      loadingPercentage = 0;
                    });
                  },
                  onWebViewCreated: (c) {
                    controller = c;
                  },
                  onProgress: (progress) {
                    setState(() {
                      loadingPercentage = progress;
                    });
                  },
                  onPageFinished: (url) {
                    setState(() {
                      loadingPercentage = 100;
                    });
                  },
                  navigationDelegate: (navigation) {
                    final host = Uri.parse(navigation.url).host;
                    if (host.contains('youtube.com')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Blocking navigation to $host',
                          ),
                        ),
                      );
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                ),
                if (loadingPercentage < 100)
                  LinearProgressIndicator(
                    value: loadingPercentage / 100.0,
                    color: Colors.blue,
                    minHeight: 10,
                  ),
              ],
            ),
            endDrawer: Drawer(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: buildmenuitem(context)),
            )));
  }

  Widget buildmenuitem(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 50,
      margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: Image.asset(
              "images/livelogo.png",
              width: 150,
              height: 150,
            ),
          ),
          ListTile(
            title: const Text(
              "الرئيسيه",
              style: TextStyle(fontSize: 17),
            ),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl('https://liveegy.com/');
            },
          ),
          ListTile(
            leading: Image.asset(
              'images/livenehal.png',
              width: 25,
              height: 30,
            ),
            title: const Text(
              "لايف نهال",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl('https://liveegy.com/category/live-nihal/');
            },
          ),
          ListTile(
            leading: Image.asset(
              'images/lightnews.png',
              width: 25,
              height: 30,
            ),
            title: const Text(
              "لايت نيوز",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl('https://liveegy.com/category/lite-news/');
            },
          ),
          ListTile(
            title: const Text(
              "ايفينت",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl('https://liveegy.com/category/event/');
            },
            leading: Image.asset(
              'images/event.png',
              width: 25,
              height: 30,
            ),
          ),
          ListTile(
            title: const Text(
              " الصحه والجمال",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://liveegy.com/category/%d8%a7%d9%84%d8%b5%d8%ad%d8%a9-%d9%88%d8%a7%d9%84%d8%ac%d9%85%d8%a7%d9%84/');
            },
            leading: Image.asset(
              'images/health.png',
              width: 25,
              height: 30,
            ),
          ),
          ListTile(
              title: const Text(
                "بيزنيس",
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
                controller.loadUrl('https://liveegy.com/category/business/');
              },
              leading: Image.asset(
                'images/business.png',
                width: 25,
                height: 30,
              )),
          ListTile(
            title: const Text(
              "عقارات",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://liveegy.com/category/%d8%b9%d9%82%d8%a7%d8%b1%d8%a7%d8%aa/');
            },
            leading: Image.asset(
              'images/builds.png',
              width: 25,
              height: 30,
            ),
          ),
          ListTile(
            title: const Text(
              "سيارات",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://liveegy.com/category/%d8%b3%d9%8a%d8%a7%d8%b1%d8%a7%d8%aa/');
            },
            leading: Image.asset(
              'images/cars.png',
              width: 25,
              height: 30,
            ),
          ),
          ListTile(
            leading: Image.asset(
              'images/tourisme.png',
              width: 25,
              height: 30,
            ),
            title: const Text(
              "سياحه",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://liveegy.com/category/%d8%b3%d9%8a%d8%a7%d8%ad%d8%a9/');
            },
          ),
          ListTile(
            leading: Image.asset(
              'images/window.png',
              width: 25,
              height: 30,
            ),
            title: const Text(
              "تكنولوجيا",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://liveegy.com/category/%d8%aa%d9%83%d9%86%d9%88%d9%84%d9%88%d8%ac%d9%8a%d8%a7/');
            },
          )
        ],
      ),
    );
  }
}
