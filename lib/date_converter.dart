String getDate(DateTime dateTime){
  String day = dateTime.day.toString();
  if(day.length == 1){
    day = '0$day';
  }

  String month = dateTime.month.toString();
  if(month.length == 1){
    month = '0$month';
  }

  String year = dateTime.year.toString();

  return year + month + day;
}