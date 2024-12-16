import 'package:flutter/material.dart';
import 'package:untitled64/detailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> apps = [
    {
      "appName": "Telegram",
      "appImages": "assets/tl.jpg",
      "releaseDate": "2023-01-01",
      "appCategory": "Social ",
      "storeURL": "https://play.google.com/store/apps/details?id=org.telegram.messenger&hl=tr"
    },
    {
      "appName": "Instagram",
      "appImages": "assets/ins.jpg",
      "releaseDate": "2022-06-15",
      "appCategory": "Social",
      "storeURL": "https://play.google.com/store/apps/details?id=com.instagram.android&hl=tr"
    },
    {
      "appName": "Whatsapp",
      "appImages": "assets/wp.png",
      "releaseDate": "2022-06-15",
      "appCategory": "Social",
      "storeURL": "https://play.google.com/store/apps/details?id=com.whatsapp&hl=tr"
    },
    {
      "appName": "Youtube",
      "appImages": "assets/yt.jpg",
      "releaseDate": "2022-06-15",
      "appCategory": "Social",
      "storeURL": "https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=tr"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.0,
          ),
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final app = apps[index];
            return Card(
              elevation: 4.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      app["appImages"]!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      app["appName"]!,
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detailpage(
                              appName: app["appName"]!,
                              releaseDate: app["releaseDate"]!,
                              appCategory: app["appCategory"]!,
                              storeURL: app["storeURL"]!,
                            ),
                          ),
                        );
                      },
                      child: Text('İleri'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
