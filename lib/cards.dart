// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// import 'package:demo/screen.dart';

// class Cards extends StatefulWidget {
//   final String sallonName;
//   final double rating;
//   final String artistName;
//   final int booking;

//   const Cards(
//       {super.key,
//       required this.sallonName,
//       required this.rating,
//       required this.artistName,
//       required this.booking});

//   @override
//   State<Cards> createState() => _CardsState();
// }

// class _CardsState extends State<Cards> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       ///clipBehavior: Clip.hardEdge,
//       borderRadius: BorderRadius.circular(10.0),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(10.0),
//         onTap: () async {
//           Navigator.of(context).pushReplacement(MaterialPageRoute(
//               builder: (context) => Screen2(
//                   booking: widget.booking,
//                   salonName: widget.sallonName,
//                   artistName: widget.artistName,
//                   rating: widget.rating.toString())));
//         },
//         child: Container(
//           width: double.maxFinite,
//           height: 200,
//           decoration: BoxDecoration(
//               color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text("Artist Name : ${widget.artistName}"),
//               const SizedBox(height: 10.0),
//               Text("Sallon Name : ${widget.sallonName}"),
//               const SizedBox(height: 10.0),
//               Text("Rating: ${widget.rating}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ArtistDetails {
//   final String name;
//   final double rating;
//   final String sallonid;
//   final String? sallonName;
//   final int? booking;

//   ArtistDetails({required this.name,
//       required this.rating,
//       required this.sallonid,
//       this.sallonName,
//       this.booking
//    });


//   ArtistDetails copyWith({
//     String? name,
//     double? rating,
//     String? sallonid,
//     String? sallonName,
//     int? booking,
//   }) {
//     return ArtistDetails(
//       name: name ?? this.name,
//       rating: rating ?? this.rating,
//       sallonid: sallonid ?? this.sallonid,
//       sallonName: sallonName ?? this.sallonName,
//       booking: booking ?? this.booking,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'rating': rating,
//       'sallonid': sallonid,
//       'sallonName': sallonName,
//       'booking': booking,
//     };
//   }

//   factory ArtistDetails.fromMap(Map<String, dynamic> map) {
//     return ArtistDetails(
//       name: map['name'] as String,
//       rating: map['rating'] as double,
//       sallonid: map['sallonid'] as String,
//       sallonName: map['sallonName'] != null ? map['sallonName'] as String : null,
//       booking: map['booking'] != null ? map['booking'] as int : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ArtistDetails.fromJson(String source) => ArtistDetails.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'ArtistDetails(name: $name, rating: $rating, sallonid: $sallonid, sallonName: $sallonName, booking: $booking)';
//   }

//   @override
//   bool operator ==(covariant ArtistDetails other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.name == name &&
//       other.rating == rating &&
//       other.sallonid == sallonid &&
//       other.sallonName == sallonName &&
//       other.booking == booking;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//       rating.hashCode ^
//       sallonid.hashCode ^
//       sallonName.hashCode ^
//       booking.hashCode;
//   }
// }
