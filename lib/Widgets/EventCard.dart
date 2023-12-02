import 'package:internet_folks/Exports/ExportFile.dart';


class EventCard extends StatefulWidget {
  Event event ;
   EventCard({
    required  this.event,
    super.key,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}


class _EventCardState extends State<EventCard> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          splashColor: customTeal,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventScreen(
              event: widget.event!,)));
          },
          child: Container(
            height: 150,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(30)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: double.maxFinite,
                      decoration: BoxDecoration(
                     //   color: Colors.red,
                          borderRadius:
                          BorderRadius.only(
                              topLeft:
                              Radius.circular(
                                  30),
                              bottomLeft:
                              Radius.circular(
                                  30))
                      ),
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        widget.event.imageUrl,
                        fit: BoxFit.fill,
                        loadingBuilder: (context , child , loadingprogress){
                           if(loadingprogress==null) return child;
                           else return Center(child: CircularProgressIndicator(
                             color: Colors.black,
                             strokeWidth: 5,
                           ));
                        },
                        errorBuilder: (context , child,st){
                          return Icon(Icons.error_outlined);
                        },
                      ),
                    ),
                  ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            //color: Colors.black,
                            borderRadius:
                            BorderRadius.only(
                                topRight:
                                Radius.circular(
                                    30),
                                bottomRight:
                                Radius.circular(
                                    30))) ,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Day , date , month , time
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  CustomDate().calculateDate(widget.event!.dateTime),
                                  style: GoogleFonts.inter(
                                      color: Color.fromRGBO(86, 105, 255, 1),
                                      fontWeight: FontWeight.w400),

                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '${widget.event?.title}',
                                style: GoogleFonts.inter(
                                   fontSize: (screenWidth>1024) ?  24 : (screenWidth>768) ? 21: 18 ,
                                    color:  Colors.black,
                                    fontWeight: FontWeight.w500),

                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '${widget.event?.organiserName}',
                                style: TextStyle(
                                    fontSize: (screenWidth>1024) ?  19 : (screenWidth>768) ? 16: 13 ,
                                    color:  customTeal,
                                    fontWeight: FontWeight.w300),

                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on , color:  Color.fromRGBO(116, 118, 136, 1),),
                                  Expanded(
                                    child: Text(
                                      '${widget.event?.venueName}, ${widget.event?.venueCity}, ${widget.event?.venueCountry}',
                                      style: GoogleFonts.inter(
                                          fontSize: (screenWidth>1024) ?  19 : (screenWidth>768) ? 16: 13 ,
                                          color:  Color.fromRGBO(116, 118, 136, 1),
                                          fontWeight: FontWeight.w400),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
