import 'package:sprint1/models/news_model.dart';

abstract class NewsService {
  Future<List<News>> getAllNews();
  Future<News> getNews();
  Future<News> addNews(News data);
  Future<News> deleteNews(int id);
}
