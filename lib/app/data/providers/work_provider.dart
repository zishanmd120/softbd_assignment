import 'package:get/get_connect.dart';
import 'package:softbd_assignment/app/data/models/todays_task_model.dart';

String url = "https://api.npoint.io/bc69ae1f6991da81ab9a";

class WorkList extends GetConnect{

  @override
  void onInit() {
    // httpClient.baseUrl = '';
  }

  Future<TodayWorkModel?> getTodayWorkList () async{
    // String url = get(url);
    Response response = await get(url);
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      var data = TodayWorkModel.fromJson(response.body);
      return data;
    }
    return null;
  }
}