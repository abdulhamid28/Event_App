import 'package:internet_folks/Exports/ExportFile.dart';

class EventDetailPageCard extends StatefulWidget {
  Widget widget ;
  String title ;
  String body ;
  EventDetailPageCard({
    super.key,
    required this.title,required this.body , required this.widget
  });

  @override
  State<EventDetailPageCard> createState() => _EventDetailPageCardState();
}

class _EventDetailPageCardState extends State<EventDetailPageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue[100],
                    ),
                    child: widget.widget),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.pink
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.title,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(widget.body ,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color:  Color.fromRGBO(116, 118, 136, 1)
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}