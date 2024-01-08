import 'package:sprint1/models/news_model.dart';
import 'package:sprint1/services/news/news_service.dart';

class NewsServiceMemory extends NewsService {
  final List<News> news = [];
  @override
  Future<List<News>> getAllNews() {
    throw UnimplementedError();
  }

  @override
  Future<News> addNews(News data) {
    int id = news.length;
    news.insert(id, data);
    return Future.value(news[id]);
  }

  @override
  Future<News> getNews() {
    return Future.value(news.isNotEmpty ? news[0] : News(id: news.length, notice: ''));
  }
  
  @override
  Future<News> deleteNews(int id) {
   final index = news.indexWhere((news) => news.getId() == id);
    news.removeAt(index);
    return Future.value(news[index]);
  }
}
