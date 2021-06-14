// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mv_bookshelf/components/book_rating.dart';
// import 'package:mv_bookshelf/components/rounded_button.dart';
// import 'package:mv_bookshelf/screens/read_screen.dart';
//
// import '../constants.dart';
//
// class DetailsScreen extends StatelessWidget {
//   final bookTitle;
//   final bookTitleBold;
//   final summary;
//   final chapterName;
//   final chapterName2;
//   final chapterName3;
//   final chapterName4;
//   final readScreenNum;
//   final bookCover;
//   const DetailsScreen({
//     Key key,
//     this.bookTitle,
//     this.bookTitleBold,
//     this.summary,
//     this.chapterName,
//     this.bookCover,
//     this.chapterName2,
//     this.chapterName3,
//     this.chapterName4,
//     this.readScreenNum,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Stack(
//               alignment: Alignment.topCenter,
//               children: <Widget>[
//                 Container(
//                   height: size.height * .53,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/bg.png"),
//                       fit: BoxFit.fitWidth,
//                     ),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(50),
//                       bottomRight: Radius.circular(50),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 24,
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: size.height * .07,
//                         ),
//                         BookInfo(
//                           title: bookTitle,
//                           titleBold: bookTitleBold,
//                           coverofbook: bookCover,
//                           summarySmall: summary,
//                           readNumber: ReadScreen(
//                             thing: readScreenNum,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: size.height * .54),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       ChapterCard(
//                         name: chapterName,
//                         chapterNum: 1,
//                         press: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return ReadScreen(
//                               thing: readScreenNum,
//                             );
//                           }));
//                         },
//                       ),
//                       ChapterCard(
//                         name: chapterName2,
//                         chapterNum: 2,
//                         press: () {},
//                       ),
//                       ChapterCard(
//                         name: chapterName3,
//                         chapterNum: 3,
//                         press: () {},
//                       ),
//                       ChapterCard(
//                         name: chapterName4,
//                         chapterNum: 4,
//                         press: () {},
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                         style: Theme.of(context).textTheme.display1,
//                         children: [
//                           TextSpan(text: "You might also "),
//                           TextSpan(
//                               text: "like",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               )),
//                         ]),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Stack(
//                     children: <Widget>[
//                       Container(
//                         height: 190,
//                         width: double.infinity,
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           padding:
//                               EdgeInsets.only(left: 24, top: 24, right: 110),
//                           height: 170,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(29),
//                             color: Colors.grey[200],
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               RichText(
//                                 text: TextSpan(
//                                     style: TextStyle(
//                                       color: kBlackColor,
//                                     ),
//                                     children: [
//                                       TextSpan(
//                                           text:
//                                               "Percy Jackson and The Titan's Curse \n",
//                                           style: TextStyle(fontSize: 20)),
//                                       TextSpan(
//                                         text: "Rick Riordan",
//                                         style: TextStyle(
//                                             color: kLightBlackColor,
//                                             fontSize: 15),
//                                       ),
//                                     ]),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: <Widget>[
//                                   BookRating(
//                                     score: 4.9,
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                       child: RoundedButton(
//                                     text: "Read",
//                                     verticalPadding: 10,
//                                   ))
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 30,
//                         right: 10,
//                         child: Image.asset(
//                           "assets/PercyJacksonBook3.jpg",
//                           width: 95,
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ChapterCard extends StatelessWidget {
//   final String name;
//   final int chapterNum;
//   final Function press;
//   const ChapterCard({
//     Key key,
//     this.name,
//     this.chapterNum,
//     this.press,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//       margin: EdgeInsets.only(bottom: 16),
//       width: size.width,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(38.5),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 10),
//               blurRadius: 33,
//               color: Color(0xFFD3D3D3).withOpacity(.84),
//             ),
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           RichText(
//             text: TextSpan(children: [
//               TextSpan(
//                 text: "Chapter $chapterNum: $name",
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: kBlackColor,
//                     fontWeight: FontWeight.bold),
//               ),
//             ]),
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.arrow_forward_ios,
//               size: 20,
//             ),
//             onPressed: press,
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class BookInfo extends StatelessWidget {
//   final title;
//   final titleBold;
//   final summarySmall;
//   final coverofbook;
//   final readNumber;
//   const BookInfo({
//     Key key,
//     this.title,
//     this.titleBold,
//     this.summarySmall,
//     this.coverofbook,
//     this.readNumber,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "$title ",
//                 style: TextStyle(fontSize: 24),
//               ),
//               Text(
//                 "$titleBold",
//                 style: Theme.of(context)
//                     .textTheme
//                     .display1
//                     .copyWith(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Expanded(
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           "$summarySmall",
//                           style: TextStyle(
//                             fontSize: 10.5,
//                             color: kLightBlackColor,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         RoundedButton(
//                           text: "Read",
//                           press: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return readNumber;
//                             }));
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(Icons.favorite_border),
//                         onPressed: () {},
//                       ),
//                       BookRating(
//                         score: 4.9,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Image.asset(
//           "$coverofbook",
//           height: 200,
//         ),
//       ],
//     );
//   }
// }
