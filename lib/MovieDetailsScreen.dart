

// class MovieDetailsScreen extends StatelessWidget {
//   final MovieR movie;
//
//   MovieDetailsScreen({required this.movie});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(movie.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(
//                 movie.imageUrl,
//                 width: 200,
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               movie.title,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text('Year: ${movie.year}'),
//             SizedBox(height: 10),
//             Text('Actors: ${movie.actors}'),
//             SizedBox(height: 20),
//             Text(
//               'Movie Description',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//