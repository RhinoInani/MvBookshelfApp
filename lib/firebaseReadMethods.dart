import 'package:firebase_database/firebase_database.dart';
import 'package:mv_bookshelf/firebaseReturn.dart';

void readTitles() async {
  int counterTitles = 0;
  await FirebaseDatabase.instance
      .reference()
      .child('Titles')
      .limitToLast(2)
      .onChildAdded
      .listen((event) {
    if (counterTitles == 0) {
      lwrTitle = event.snapshot.value.toString();
      counterTitles++;
    } else {
      twrTitle = event.snapshot.value.toString();
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

void readAuthor() async {
  int counterAuthor = 0;
  await FirebaseDatabase.instance
      .reference()
      .child('Author')
      .limitToLast(2)
      .onChildAdded
      .listen((event) {
    if (counterAuthor == 0) {
      lwrAuthor = event.snapshot.value.toString();
      counterAuthor++;
    } else {
      twrAuthor = event.snapshot.value.toString();
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
        int.parse(upcomingEvents.substring(0, upcomingEvents.indexOf(",")));
    upDay = int.parse(upcomingEvents.substring(
        upcomingEvents.indexOf(",") + 1, upcomingEvents.length));
  });
}
