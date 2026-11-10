import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/image_network.dart';
import 'package:flutter_application_1/features/news/model/articles_model.dart';
import 'package:flutter_application_1/features/news/news_details/screen/news_details.dart';
import 'package:flutter_svg/svg.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this._articlesModel, this.pageUsedName});
  final ArticlesModel _articlesModel;
  final String? pageUsedName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(articlesModel: _articlesModel),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(4),
            child: ImageNetwork(urlImage: _articlesModel.urlToImage),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Text(
                  _articlesModel.title ?? "",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(height: 2),
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
                      style: pageUsedName == "category"
                          ? Theme.of(context).textTheme.bodySmall!
                                .copyWith(fontSize: 16)
                          : Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "2 h",
                      style: pageUsedName == "category"
                          ? Theme.of(context).textTheme.displaySmall!
                                .copyWith(fontSize: 16)
                          : Theme.of(context).textTheme.displaySmall,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("images/save_Icon.svg"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
