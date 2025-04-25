import 'package:red_cell/core/DM/news_Dm.dart';
import 'package:red_cell/core/helper/api.dart';

class GetNews {


  Future<List<NewsDm>> getNews(String category) async {
    List<dynamic> newsData = [];
    List<NewsDm> newsInDM = [];
    String apiKey = "pub_75174de43bbc42e87240a00980826147d1135";
    String url = 'https://newsdata.io';
    String resourceURL =
        "$url/api/1/latest?apikey=$apiKey&country=eg&category=$category";
    newsData = await Api().get(resourceURL);
    for(int i = 0 ;i<newsData.length;i++){
      newsInDM.add(NewsDm.fromJson(newsData[i]));
    }
    return newsInDM;
  }
}
