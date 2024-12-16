import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailpage extends StatefulWidget {
  final String appName;
  final String releaseDate;
  final String appCategory;
  final String storeURL;

  Detailpage({
    super.key,
    required this.appName,
    required this.releaseDate,
    required this.appCategory,
    required this.storeURL,
  });

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  Future<void> _launchURL() async {
    final Uri url = Uri.parse(widget.storeURL);
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${widget.storeURL}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding genel olarak artırıldı
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "App Name: ${widget.appName}",
              style: TextStyle(
                fontSize: 20, // Yazı büyüklüğü arttırıldı
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Daha koyu renk
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Release Date: ${widget.releaseDate}",
              style: TextStyle(
                fontSize: 16, // Yazı büyüklüğü biraz küçültüldü
                fontWeight: FontWeight.w600,
                color: Colors.black54, // Daha açık renk
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Category: ${widget.appCategory}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 30), // Üstten daha fazla boşluk
            Center( // Butonun ortalanması
              child: ElevatedButton(
                onPressed: _launchURL,
                child: Text('Open Store URL'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Buton rengi
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Butonun boyutlandırılması
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Butonun yuvarlatılması
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
