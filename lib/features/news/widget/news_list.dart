import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/news/manager/news_controller.dart';
import 'package:flutter_application_1/features/news/news_details/screen/news_details.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, this.pageUsedName});
  final String? pageUsedName;
  @override
  Widget build(BuildContext context) {
    final readController = context.read<NewsController>();
    return SliverList.separated(
      itemCount: readController.everythingNews.length,
      itemBuilder: (context, index) {
        return Consumer<NewsController>(
          builder: (context, controller, child) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetails(
                      articlesModel: controller.everythingNews[index],
                    ),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: .start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(4),
                    child: controller.everythingNews[index].urlToImage != null
                        ? Image.network(
                            fit: BoxFit.cover,
                            controller.everythingNews[index].urlToImage!,
                            width: 122,
                            height: 68,
                          )
                        : Image.network(
                            width: 122,
                            height: 68,
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTFH3NidfLUTCazwSaOSy-i8sSjSm7kDtrOK27KJVwBb2VMEok6mUryI&s=10",
                          ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          controller.everythingNews[index].title ?? "",
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
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 12),
    );
  }
}
