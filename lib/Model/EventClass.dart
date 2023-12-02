
class Event{
  int id ; // "id": 1,
  String title ; //"title": "GopherCon Europe",
  String description ; //"description": "A conference for Go developers in Europe. GopherCon Europe is a conference for Go developers that takes place annually in Europe. It's a great opportunity to meet and learn from fellow Gophers, network with companies using Go, and get insights on the latest developments and trends in the Go community.",
  String imageUrl ; //"banner_image": "https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg",
  String dateTime ; //"date_time": "2023-06-01T09:00:00+02:00",
  String organiserName ; //"organiser_name": "GopherCon Europe",
  String organiserIcon ; //"organiser_icon": "https://icons-for-free.com/iconfiles/png/512/vscode+icons+type+go+gopher-1324451308133525243.png",
  String venueName ; //"venue_name": "Beurs van Berlage",
  String venueCity ; //"venue_city": "Amsterdam",
  String venueCountry ; //"venue_country": "Netherlands"

 Event({
   required this.id,
   required this.title,
   required this.description,
   required this.imageUrl,
   required this.dateTime,
   required this.organiserName,
   required this.organiserIcon,
   required this.venueName,
   required this.venueCity,
   required this.venueCountry
 });

 factory Event.fromJson(Map<String, dynamic> eventMap){
   return Event(
       id: eventMap["id"] as int,
       title: eventMap["title"] as String,
       description: eventMap["description"] as String ,
       imageUrl: eventMap["banner_image"] as String,
       dateTime: eventMap["date_time"] as String,
       organiserName: eventMap["organiser_name"] as String,
       organiserIcon: eventMap["organiser_icon"] as String,
       venueName: eventMap["venue_name"] as String,
       venueCity: eventMap["venue_city"] as String,
       venueCountry: eventMap["venue_country"] as String) ;
 }

}
