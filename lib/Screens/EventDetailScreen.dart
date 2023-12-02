import 'package:internet_folks/Exports/ExportFile.dart';

class EventScreen extends StatelessWidget {
  final Event event;
  CustomDate customDate = CustomDate();
  EventScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double notificationHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        width: screenWidth,
        height: screenHeight - notificationHeight,
        //  color: Colors.yellow,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: ((screenHeight) * 0.3) - notificationHeight,
                child: Stack(children: [
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Image.asset(
                      'assets/icons/eventwp.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 34,
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Events Details',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                height: screenHeight * 0.7 - (2 * notificationHeight),
                width: screenWidth,
                // color: Colors.blue,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          event.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      EventDetailPageCard(
                        title: event.organiserName,
                        widget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(event.organiserIcon, fit: BoxFit.contain ,
                              loadingBuilder: (context , child , loadingprogress){
                                if(loadingprogress==null) return child;
                                else return Center(child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 5,
                                ));
                              } ,
                            errorBuilder: (context , child , st){
                                return Icon(Icons.people_alt ,
                                  color: Colors.blue[800],
                                  size: 45,
                                );
                            },
                          ),
                        ),
                        body: 'Organiser',
                      ),
                      EventDetailPageCard(
                        title: '${DateTime.parse(event.dateTime).day} '+
                            '${customDate.FindMonth(DateTime.parse(event.dateTime).month)},' +
                            ' ${DateTime.parse(event.dateTime).year}',
                        widget: Icon(Icons.calendar_month,
                          color: Colors.blue[800],
                          size: 45,
                        ) ,
                        body: '${customDate.FindDayOfTheWeek(DateTime.parse(event.dateTime).weekday)},'+
                        ' ${DateTime.parse(event.dateTime).hour}:00 '+'${(DateTime.parse(event.dateTime).hour<11) ? 'AM' : 'PM'}',
                      ),
                      EventDetailPageCard(title: event.venueName,
                          body: event.venueCity+ event.venueCountry,
                          widget:  Icon(Icons.location_on,
                            color: Colors.blue[800],
                            size: 45,
                          ) , ),
                      Text('About Event',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                        fontSize: 18,color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(event.description,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inter(
                              fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w400
                          ),),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          height: 100,
          width: screenWidth,
          // decoration: BoxDecoration(color: Colors.red),
          child: Center(
            child: Material(
              shadowColor: Colors.white,
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              elevation: 5,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  width: screenWidth * 0.6,
                  child: Text(
                    'BOOK NOW',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


