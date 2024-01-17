import 'package:sprint1/models/news_model.dart';
import 'package:sprint1/services/news/news_service.dart';

class NewsServiceMemory extends NewsService {
  final List<News> news = [];
  
  @override
  Future<List<News>> getAllNews() async{
    return news;
  }

  @override
  Future<News> addNews(News data) async{
    int id = news.length;
    news.insert(id, data);
    return news[id];
  }

  @override
  Future<News> getNews() async{
    return news.isNotEmpty ? news[0] : News(id: news.length, notice: '');
  }
  
  @override
  Future<News> deleteNews(int id) async{
   final index = news.indexWhere((news) => news.getId() == id);
    news.removeAt(index);
    return news[index];
  }
}
