import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/news_Dm.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final NewsDm newsDm;

  const NewsCard({super.key, required this.newsDm});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(newsDm.newsLink));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              child: Image(
                errorBuilder: (context, error, stackTrace) {
                  return Image(image: AssetImage(AssetsManeger.notLoading));
                },
                image: NetworkImage(newsDm.imageUrl),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Text(
                newsDm.title,
                textAlign: TextAlign.end,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
