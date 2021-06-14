// import 'package:flutter/material.dart';
// import 'package:mv_bookshelf/components/search_reading_card.dart';
// import 'package:mv_bookshelf/screens/details_screen.dart';
//
// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Bar"),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(context: context, delegate: DataSearch());
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//           SearchReadCard(
//               title: "Percy Jackson and the Lightning Theif",
//               author: "Rick Riordan"),
//         ],
//       ),
//     );
//   }
// }
//
// class DataSearch extends SearchDelegate {
//   final books = [
//     "The Hunger Games (The Hunger Games, #1)",
//     "Harry Potter and the Sorcerer's Stone (Harry Potter, #1)",
//     "Twilight (Twilight, #1)",
//     "To Kill a Mockingbird",
//     "The Great Gatsby",
//     "The Fault in Our Stars",
//     "The Hobbit",
//     "The Catcher in the Rye",
//     "Angels & Demons  (Robert Langdon, #1)",
//     "Pride and Prejudice",
//     "The Kite Runner",
//     "Divergent (Divergent, #1)",
//     "1984",
//     "Animal Farm",
//     "The Diary of a Young Girl",
//     "The Girl with the Dragon Tattoo (Millennium, #1)",
//   ];
//
//   final recentBooks = [
//     "1984",
//     "Animal Farm",
//     "The Diary of a Young Girl",
//     "The Girl with the Dragon Tattoo (Millennium, #1)",
//   ];
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // actions for search bar
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     // leading icon on the left of the search bar
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return DetailsScreen(
//       chapterName: "I Accidentally Vaporized",
//       chapterName2: "Three Old Ladies Knit",
//       chapterName3: "Grover Unexpectedly",
//       chapterName4: "My Mother Teaches",
//       bookTitle: "Percy Jackson and ",
//       bookTitleBold: "The Lightning Thief",
//       bookCover: "assets/PercyJacksonBook1.jpg",
//       readScreenNum: "assets/PJBook1.pdf",
//       summary:
//           "On the first day of summer, just after his sixth-grade year, Percy discovers that something is wrong with him. Or rather, something is right with him. He learns that he is a half-blood: half-human, half-god. He is taken to Camp Half-Blood in New York, a camp for kids just like him that is safe from monsters that like to attack half-bloods.",
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty
//         ? recentBooks
//         : books.where((p) => p.startsWith(query)).toList();
//
//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: () {
//           showResults(context);
//         },
//         leading: Icon(Icons.book),
//         title: RichText(
//           text: TextSpan(
//               text: suggestionList[index].substring(0, query.length),
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               children: [
//                 TextSpan(
//                     text: suggestionList[index].substring(query.length),
//                     style: TextStyle(color: Colors.grey))
//               ]),
//         ),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }
