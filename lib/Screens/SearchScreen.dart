import 'package:internet_folks/Exports/ExportFile.dart';
import 'package:internet_folks/Model/BlocState.dart';
import 'package:internet_folks/Model/FetchData.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FetchDataFromApi searcDataFromApi = FetchDataFromApi();

  @override
   initState()  {
    searcDataFromApi.fetchData(flag: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back, color: Colors.black,size: 34,)),
        elevation: 0,
        title: Text('Search',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 24 ,
          color: Colors.black,
        ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/search34.svg',
                        color: Color.fromRGBO(86, 105, 255, 1.0),
                        // need to solve
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      onChanged: (String input)=> searcDataFromApi.SearchData(input),
                       autofocus: false,
                       decoration: InputDecoration(
                         border: InputBorder.none,
                       hintText: ' Search Event Here',
                       hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(116, 118, 136, 1),
                          fontSize: 20
                        ),
                      ),

                      style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: Container(
               // color: Colors.red,
                child: StreamBuilder(
                  stream: myBlocState.stateController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) return ListView.builder(
                          itemCount: 4,
                          itemBuilder : (context , index)=>  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer(
                              color: Colors.grey,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black.withOpacity(0.04)),
                                height: 150,width: double.maxFinite,
                              ),
                            ),
                          ),
                        );
                    else return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) =>
                          EventCard( event : snapshot.data![index]),
                    );
                  },
                )
              ))
            ],
          ),
        ),
      ),
    );
  }

}


