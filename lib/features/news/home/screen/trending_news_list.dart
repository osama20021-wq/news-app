import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/news/model/articles_model.dart';
import 'package:flutter_application_1/features/news/news_details/screen/news_details.dart';

class TrendingNewsList extends StatelessWidget {
  const TrendingNewsList({
    super.key,
    required this.articlesList,
    required this.index,
  });
  final List<ArticlesModel> articlesList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NewsDetails(articlesModel: articlesList[index]),
          ),
        );
      },
      child: Container(
        width: 239,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  articlesList[index].urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTFH3NidfLUTCazwSaOSy-i8sSjSm7kDtrOK27KJVwBb2VMEok6mUryI&s=10",
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      fit: BoxFit.cover,
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTFH3NidfLUTCazwSaOSy-i8sSjSm7kDtrOK27KJVwBb2VMEok6mUryI&s=10",
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    articlesList[index].title ?? "",
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            "images/cnn-1.png",
                            width: 12,
                            height: 5.58,
                          ),
                        ),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        "CNN News",
                        style: Theme.of(context).textTheme.bodySmall!
                            .copyWith(color: Color(0xFFFFFFFF)),
                      ),

                      const Spacer(),

                      const Text(
                        "2 hours ago",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
