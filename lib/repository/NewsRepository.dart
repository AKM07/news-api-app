import 'package:dio/dio.dart';
import 'package:mobile_skeleton/constants/Constants.dart';
import 'package:mobile_skeleton/constants/UrlConstants.dart';
import 'package:mobile_skeleton/model/BaseAllResponse.dart';
import 'package:mobile_skeleton/model/LoadApiStatus.dart';
import 'package:mobile_skeleton/model/response/GetNewsResponse.dart';
import 'package:mobile_skeleton/utils/injector.dart';

class NewsRepository {
  final Dio dio = locator<Dio>();

  Future<BaseAllResponse<GetNewsResponse>> getNewsData() async {
    try {
      dio.options.contentType = "application/json";
      Response response = await dio.get(UrlConstants.GET_NEWS_URL,
          queryParameters: {'country': 'us', 'apiKey': Constants.apiKey});

      GetNewsResponse newsData = GetNewsResponse.fromJson(response.data);

      BaseAllResponse<GetNewsResponse> baseData =
          new BaseAllResponse<GetNewsResponse>();
      baseData.data = newsData;
      baseData.status = LoadApiStatus.COMPLETED;
      return baseData;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
