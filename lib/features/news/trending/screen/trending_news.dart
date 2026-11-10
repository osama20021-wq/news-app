import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/news/manager/news_controller.dart';
import 'package:flutter_application_1/features/news/widget/news_list.dart';
import 'package:provider/provider.dart';

class TrendingNewsScreen extends StatelessWidget {
  const TrendingNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text("Trending News")),
      body: Consumer<NewsController>(
        builder: (context, controller, child) => controller.isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.black))
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    sliver: SliverList.separated(
                      itemCount: controller.everythingNews.length,

                      itemBuilder: (context, index) {
                        return NewsList(
                          articlesModel: controller.everythingNews[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
