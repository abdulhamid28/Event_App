class CustomDate{
    String FindDayOfTheWeek(int weeknumber){

      if(weeknumber==1) return 'Mon';
      else if(weeknumber==2) return 'Tue';
      else if(weeknumber==3) return 'Wed';
      else if(weeknumber==4) return 'Thu';
      else if(weeknumber==5) return 'Fri';
      else if(weeknumber==6) return 'Sat';
      else return 'Sun';

    }
    String FindMonth(int monthnumber){
      if(monthnumber==1)      return 'Jan';
      else if(monthnumber==2) return 'Feb';
      else if(monthnumber==3) return 'Mar';
      else if(monthnumber==4) return 'Apr';
      else if(monthnumber==5) return 'May';
      else if(monthnumber==6) return 'Jun';
      else if(monthnumber==7) return 'Jul';
      else if(monthnumber==8) return 'Aug';
      else if(monthnumber==9) return 'Sep';
      else if(monthnumber==10) return 'Oct';
      else if(monthnumber==11) return 'Nov';
      else return 'Dec';

    }

    String calculateDate(String dt){
      DateTime dateTime = DateTime.parse(dt);
      return
        '${FindDayOfTheWeek(dateTime.weekday)}, ${FindMonth(dateTime.month)} ${dateTime.day}  |  ${dateTime.hour}:${dateTime.minute}0 ${(dateTime.hour<11) ? 'AM' : 'PM'}';
    }
}