import 'package:internet_folks/Screens/HomeScreen.dart';

import 'Exports/ExportFile.dart';

void main(){
  runApp(EventApp());

}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
