import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/news/manager/news_controller.dart';
import 'package:flutter_application_1/features/news/widget/category_widget.dart';
import 'package:flutter_application_1/features/news/widget/news_list.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text("Categories")),
      body: Consumer<NewsController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CategoryWidget(),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.all(16),
                sliver: SliverList.separated(
                  itemCount: controller.topHeadLineNews.length,
                  itemBuilder: (context, index) {
                    return NewsList(
                      pageUsedName: "category",
                      articlesModel: controller.topHeadLineNews[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 12);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
