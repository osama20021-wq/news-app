import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/repositories/repository_service.dart';
import 'package:flutter_application_1/features/news/model/articles_model.dart';

class NewsController extends ChangeNotifier {
  bool isLoading = false;
  final RepositoryService _service = RepositoryService();
  List<ArticlesModel> topHeadLineNews = [];
  List<ArticlesModel> everythingNews = [];

  void init() {
    getTopHeadLineNews();
    geteverythingNews();
  }

  void getTopHeadLineNews() async {
    try {
      isLoading = true;
      notifyListeners();
      topHeadLineNews = await _service.getHeadLineNews();
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void geteverythingNews() async {
    try {
      isLoading = true;
      notifyListeners();
      everythingNews = await _service.getEverythingNews();
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
