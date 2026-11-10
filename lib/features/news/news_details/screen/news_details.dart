// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/news/model/articles_model.dart';
import 'package:flutter_svg/svg.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({super.key, required this.articlesModel});
  ArticlesModel articlesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text("News Details")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(4),
                child: Image.network(
                  fit: BoxFit.cover,
                  articlesModel.urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTFH3NidfLUTCazwSaOSy-i8sSjSm7kDtrOK27KJVwBb2VMEok6mUryI&s=10",
                ),
              ),
              SizedBox(height: 12),
              Text(
                articlesModel.title ?? "No Title",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF141414),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        width: 12,
                        height: 5.58,
                        "images/cnn-1.png",
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "CNN News",
                    style: Theme.of(context).textTheme.bodySmall!
                        .copyWith(fontSize: 14),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "2 h ago",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "images/save_Icon.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Text(
                articlesModel.description ?? "No Description",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF363636),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
