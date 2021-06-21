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

void readAll() async {
  pdfUrl.clear();
  title.clear();
  author.clear();
  imageUrl.clear();
  pdfUrl = new List.generate(previousCounter, (index) => "test");
  title = new List.generate(previousCounter, (index) => "test");
  author = new List.generate(previousCounter, (index) => "test");
  imageUrl = new List.generate(previousCounter, (index) => "test");
  dynamic ref = await FirebaseDatabase.instance.reference();
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
