import 'package:firebase_database/firebase_database.dart';
import 'package:mv_bookshelf/backend/firebaseReturn.dart';

Future<void> readTitles() async {
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

Future<void> readPdfUrl() async {
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

Future<void> readImageUrl() async {
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

Future<void> readCount() async {
  final ref = await FirebaseDatabase.instance.reference();
  String input;
  ref.child("Count").onValue.listen(
    (event) {
      input = event.snapshot.value.toString();
      previousCounter = int.parse(input.substring(0, input.indexOf(",")));
      upcomingCounter = int.parse(input.substring(input.indexOf(',') + 1));
    },
  );
}

Future<void> readUpcoming() async {
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
        upcomingEvents.indexOf("/") + 1, upcomingEvents.indexOf("~")));
    upYear = int.parse(upcomingEvents.substring(
        upcomingEvents.indexOf("~") + 1, upcomingEvents.indexOf("`")));
    upEvent = upcomingEvents.substring(upcomingEvents.indexOf("`") + 1);
  });
}

Future<void> readAllReadings() async {
  final ref = FirebaseDatabase.instance.reference();
  pdfUrl = new List.generate(previousCounter, (index) => "test");
  title = new List.generate(previousCounter, (index) => "test");
  author = new List.generate(previousCounter, (index) => "test");
  imageUrl = new List.generate(previousCounter, (index) => "test");
  int pdfCounter = 0;
  ref.child('Pdf').limitToLast(previousCounter).onChildAdded.listen((event) {
    pdfUrl.insert(pdfCounter, event.snapshot.value.toString());
    pdfCounter++;
  });
  int titlesCounter = 0;
  String tempReturn = "";
  ref.child('Titles').limitToLast(previousCounter).onChildAdded.listen((event) {
    tempReturn = event.snapshot.value.toString();
    title.insert(
        titlesCounter, tempReturn.substring(0, tempReturn.indexOf(",")));
    author.insert(
        titlesCounter, tempReturn.substring(tempReturn.indexOf(",") + 1));
    titlesCounter++;
  });
  int imageCounter = 0;
  ref.child('Image').limitToLast(previousCounter).onChildAdded.listen((event) {
    imageUrl.insert(imageCounter, event.snapshot.value.toString());
    imageCounter++;
  });
}

Future<void> readAllUpcoming() async {
  String upcomingEvents;
  allUpcomingDates =
      new List.generate(previousCounter, (index) => DateTime(2005, 6, 30));
  allUpcomingEvents = new List.generate(previousCounter, (index) => "test");
  int counter = 0;
  await FirebaseDatabase.instance
      .reference()
      .child('Upcoming')
      .onChildAdded
      .listen(
    (event) {
      upcomingEvents = event.snapshot.value.toString();
      int month =
          int.parse(upcomingEvents.substring(0, upcomingEvents.indexOf("/")));
      int day = int.parse(upcomingEvents.substring(
          upcomingEvents.indexOf("/") + 1, upcomingEvents.indexOf("~")));
      int year = int.parse(upcomingEvents.substring(
          upcomingEvents.indexOf("~") + 1, upcomingEvents.indexOf("`")));
      String events = upcomingEvents.substring(upcomingEvents.indexOf("`") + 1);

      allUpcomingDates.insert(counter, DateTime(year, month, day));
      allUpcomingEvents.insert(counter, events);

      counter++;
    },
  );
}
