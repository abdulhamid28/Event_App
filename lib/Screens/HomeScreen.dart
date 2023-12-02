import 'package:internet_folks/Exports/ExportFile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FetchDataFromApi fetchDataFromApi = FetchDataFromApi();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double notificationBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
              // color: Colors.red
              ),
          child: Column(
            children: [
              //header
              Container(
                height: screenHeight * (1 / 5),
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Welcoming text
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            (screenWidth<768) ?  Text('Hello, Folks',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: (screenWidth > 1024)
                                      ? 42
                                      : (screenHeight > 768)
                                          ? 32
                                          : 24,
                                )): Container(),
                          ],
                        ),
                      ),
                      // Events and search
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Event
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2, color: Colors.black))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (screenWidth < 768)
                                      ? SvgPicture.asset(
                                          'assets/icons/home34.svg',
                                          height: (screenWidth > 1024)
                                              ? 40
                                              :  24,
                                          //  color: customTeal, // need to solve
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/home34.svg',
                                          height: (screenWidth > 1024)
                                              ? 40
                                              : 24,
                                          //  color: customTeal, // need to solve
                                        ),
                                ),
                                Text(
                                  'Events',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: (screenWidth > 1024)
                                        ? 40
                                        : (screenHeight > 768)
                                            ? 24
                                            : 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Search icon
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Material(
                              elevation: 5,
                              color: Colors.white, //customTeal,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                splashColor: Colors.grey,
                                onTap: () {
                                  //fetchDataFromApi.fetchData();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: (screenWidth < 768)
                                      ? SvgPicture.asset(
                                          'assets/icons/search34.svg',
                                          height: (screenWidth > 1024)
                                              ? 40
                                              : (screenHeight > 768)
                                                  ? 35
                                                  : 24,
                                          // need to solve
                                        )
                                      : Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: SvgPicture.asset(
                                            'assets/icons/search64.svg',
                                            height: (screenWidth > 1024)
                                                ? 40
                                                : (screenHeight > 768)
                                                    ? 35
                                                    : 24,
                                            // need to solve
                                          ),
                                      ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // list of events
              Container(
                height: screenHeight * (4 / 5) - notificationBar,
                width: screenWidth,
                decoration: BoxDecoration(
                    //   color: Colors.red
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: FutureBuilder(
                    future: fetchDataFromApi.fetchData(flag: false),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer(
                              color: Colors.grey,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black.withOpacity(0.04)),
                                height: 150,
                                width: double.maxFinite,
                              ),
                            ),
                          ),
                        );
                      } else
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) =>
                              EventCard(event: snapshot.data![index]),
                        );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
