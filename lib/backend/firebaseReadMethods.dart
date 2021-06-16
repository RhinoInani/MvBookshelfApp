import 'package:firebase_database/firebase_database.dart';
import 'package:mv_bookshelf/backend/firebaseReturn.dart';

void readTitles() async {
  int counterTitles = 0;
  String tempReturn;
  await FirebaseDatabase.instance
      .reference()
      .child('Titles')
      .limitToLast(2)
      .onChildAdded
      .listen((event) {
    if (counterTitles == 0) {
      tempReturn = event.snapshot.value.toString();
      lwrTitle = tempReturn.substring(0, tempReturn.indexOf(","));
      lwrAuthor = tempReturn.substring(tempReturn.indexOf(",") + 1);
      counterTitles++;
    } else {
      tempReturn = event.snapshot.value.toString();
      twrTitle = tempReturn.substring(0, tempReturn.indexOf(","));
      twrAuthor = tempReturn.substring(tempReturn.indexOf(",") + 1);
    }
  });
}

void readPdfUrl() async {
  int counterPdf = 0;
  await FirebaseDatabase.instance
      .reference()
      .child('Pdf')
      .limitToLast(2)
      .onChildAdded
      .listen((event) {
    if (counterPdf == 0) {
      lwrPdfUrl = event.snapshot.value.toString();
      counterPdf++;
    } else {
      twrPdfUrl = event.snapshot.value.toString();
    }
  });
}

void readImageUrl() async {
  int counterImage = 0;
  await FirebaseDatabase.instance
      .reference()
      .child('Image')
      .limitToLast(2)
      .onChildAdded
      .listen((event) {
    if (counterImage == 0) {
      lwrImageUrl = event.snapshot.value.toString();
      counterImage++;
    } else {
      twrImageUrl = event.snapshot.value.toString();
    }
  });
}

void readUpcoming() async {
  String upcomingEvents;
  await FirebaseDatabase.instance
      .reference()
      .child('Upcoming')
      .limitToLast(1)
      .onChildAdded
      .listen((event) {
    upcomingEvents = event.snapshot.value.toString();
    upMonth =
        int.parse(upcomingEvents.substring(0, upcomingEvents.indexOf("/")));
    upDay = int.parse(upcomingEvents.substring(
        upcomingEvents.indexOf("/") + 1, upcomingEvents.indexOf(",")));
    upEvent = upcomingEvents.substring(upcomingEvents.indexOf(",") + 1);
  });
}
