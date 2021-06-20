//twr stands for this weeks reading
String twrPdfUrl;
String twrImageUrl;
String twrTitle;
String twrAuthor;

//lwr stands for last week reading
String lwrPdfUrl;
String lwrImageUrl;
String lwrTitle;
String lwrAuthor;

int upMonth;
int upDay;
String upEvent;

int previousCounter = 5;
List<String> pdfUrl = List.generate(previousCounter, (index) => "test");
List<String> imageUrl = List.generate(previousCounter, (index) => "test");
List<String> title = List.generate(previousCounter, (index) => "test");
List<String> author = List.generate(previousCounter, (index) => "test");
