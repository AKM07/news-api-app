import 'package:flutter/cupertino.dart';
import 'package:mobile_skeleton/model/BaseAllResponse.dart';
import 'package:mobile_skeleton/model/response/GetNewsResponse.dart';
import 'package:mobile_skeleton/repository/NewsRepository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final NewsRepository repository = NewsRepository();
  final BehaviorSubject<BaseAllResponse<GetNewsResponse>> newsSubject =
      BehaviorSubject<BaseAllResponse<GetNewsResponse>>();

  getNewsData() async {
    newsSubject.add(BaseAllResponse.loading('Please Wait'));
    try {
      BaseAllResponse<GetNewsResponse> response =
          await repository.getNewsData();
      newsSubject.add(BaseAllResponse.completed(response.data));
    } catch (e) {
      debugPrint("exception " + e.toString());
      newsSubject.sink.add(BaseAllResponse.error(""));
    }
  }

  dispose() {
    newsSubject.close();
  }

  BehaviorSubject<BaseAllResponse<GetNewsResponse>> get getMessagesSubject =>
      newsSubject;
}
