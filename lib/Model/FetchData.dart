import 'package:internet_folks/Exports/ExportFile.dart';
import 'package:http/http.dart ' as Http;

class FetchDataFromApi{

  String baseUrl = "https://sde-007.api.assignment.theinternetfolks.works/v1/event";

  Future<List<Event>> fetchData({required bool flag}) async {
    Http.Response response  =   await Http.get(Uri.parse(baseUrl));
    List<Event> eventList =[];
    if(response.statusCode==200){
       var body = jsonDecode(response.body.toString());
       final Iterable list = body["content"]["data"];
       eventList = list.map((document) => Event.fromJson(document)).toList() ;
    }
    if(flag ==true) {
      myBlocState.stateController.sink.add(eventList);
    }
    return eventList;
  }

   SearchData (String query) async {
     myBlocState.stateController.sink.add([]);
     String searchUrl = baseUrl+'?search=${query}';
     Http.Response response  =   await Http.get(Uri.parse(searchUrl));
     List<Event> searchList =[];
     if(response.statusCode==200){
        var body = jsonDecode(response.body.toString());
        final Iterable list = body["content"]["data"];
        searchList = list.map((document) => Event.fromJson(document)).toList() ;
     }
     myBlocState.stateController.sink.add(searchList);

   }

}