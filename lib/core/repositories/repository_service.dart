import 'package:flutter_application_1/core/apis/dio_service.dart';
import 'package:flutter_application_1/core/constants/storge_key.dart';
import 'package:flutter_application_1/features/news/model/articles_model.dart';

class RepositoryService {
  final DioService _dioService = DioService();
  Future<List<ArticlesModel>> getHeadLineNews() async {
    try {
      List<ArticlesModel> articles = [];
      final response = await _dioService.getUrl(StorgeKey.topHeadLineNews);
      for (Map<String, dynamic> data in response.data["articles"]) {
        articles.add(ArticlesModel.fromJson(data));
      }
      return articles;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticlesModel>> getEverythingNews() async {
    try {
      List<ArticlesModel> articles = [];
      final response = await _dioService.getUrl(StorgeKey.everythingNews);
      for (Map<String, dynamic> data in response.data["articles"]) {
        articles.add(ArticlesModel.fromJson(data));
      }
      return articles;
    } catch (e) {
      rethrow;
    }
  }
}
