import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/storge_key.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: StorgeKey.categories.length,
        itemBuilder: (context, index) {
          return Text(
            StorgeKey.categories[index],
            style: TextStyle(color: Colors.black),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 12);
        },
      ),
    );
  }
}
