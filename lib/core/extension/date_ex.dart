import 'package:intl/intl.dart';

extension DateEx on DateTime{
  String get monthName{
    return DateFormat("MMMM").format(this);
  }
  DateTime get lastDate{
    if(this.month<10){
      return DateTime.parse("${DateTime.now().year}-0${DateTime.now().month+4}-${DateTime.now().day} 00:00:00.000");
    }else{
      return DateTime.parse("${DateTime.now().year}-${DateTime.now().month+4}-${DateTime.now().day} 00:00:00.000");
    }
  }
}