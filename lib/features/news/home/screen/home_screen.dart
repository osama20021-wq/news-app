// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/news/categories/screen/categories_screen.dart';
import 'package:flutter_application_1/features/news/news_details/screen/news_details.dart';
import 'package:flutter_application_1/features/news/widget/category_widget.dart';
import 'package:flutter_application_1/features/news/manager/news_controller.dart';
import 'package:flutter_application_1/features/news/widget/news_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsController()..init(),
      builder: (context, child) {
        return Consumer<NewsController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(color: (Colors.black)),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 242,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/images2.png"),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 75),
                            SizedBox(child: Image.asset("images/Vector1.png")),
                            SizedBox(height: 14),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),

                              child: Row(
                                children: [
                                  Text(
                                    "Trending News",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "View all",
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white,
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 145,
                        left: 16,
                        right: 16,
                        child: SizedBox(
                          height: 139,
                          child: Consumer<NewsController>(
                            builder: (context, controller, child) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.topHeadLineNews.length,

                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetails(
                                            articlesModel: controller
                                                .topHeadLineNews[index],
                                          ),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.network(
                                                controller
                                                        .topHeadLineNews[index]
                                                        .urlToImage ??
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTFH3NidfLUTCazwSaOSy-i8sSjSm7kDtrOK27KJVwBb2VMEok6mUryI&s=10",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  controller
                                                          .topHeadLineNews[index]
                                                          .title ??
                                                      "",
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),

                                                const SizedBox(height: 4),

                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
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
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),

                                                    const Spacer(),

                                                    const Text(
                                                      "2 hours ago",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 10);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF141414),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNotifierProvider(
                                          create: (context) =>
                                              NewsController()
                                                ..geteverythingNews(),
                                          child: CategoriesScreen(),
                                        ),
                                  ),
                                );
                              },
                              child: Text(
                                "View all",
                                style: TextStyle(
                                  color: Color(0xFF141414),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        CategoryWidget(),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsetsGeometry.all(16),
                  sliver: NewsList(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
