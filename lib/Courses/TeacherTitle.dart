// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kc54learning/Themes/TextFieldStyles.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class TeacherTitle extends StatefulWidget {
//   const TeacherTitle({super.key});

//   @override
//   State<TeacherTitle> createState() => _TeacherTitleState();
// }

// class _TeacherTitleState extends State<TeacherTitle> {
//   late YoutubePlayerController _youtubePlayerController;
//   final VideoURL = "https://www.youtube.com/watch?v=FUlbQqU69mE";

//   @override
//   void initState() {
//     super.initState();
//     final VideoID = YoutubePlayer.convertUrlToId(VideoURL);

//     _youtubePlayerController = YoutubePlayerController(initialVideoId: VideoID!,
//     flags: YoutubePlayerFlags(
//       autoPlay: true
//     )
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('C#(Кирилл Михайлович Бастрыкин)', style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
//         iconTheme: IconThemeData(
//           color: Colors.blueAccent
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 25,right: 25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//           Expanded(child: Container(),flex: 5,),
//           Expanded(child: Row(
//             children: [
//               Expanded(child: CircleAvatar(
//                 radius: 100,
//                 backgroundImage:  NetworkImage('https://s930sas.storage.yandex.net/rdisk/8284ffa1770cdd456e2c806ff51c8de98a9a1eba6a108b7ce9a75588451d7c72/65fc4557/4hw2htyfX7Siicf_WXW5TQanAUK-AiQg38pCf4p6Mf0k6sOpK2mTLmxTh9RrhFZ509pHOdhg5_FcSkePvlTsKQ==?uid=1887524084&filename=n_62bc19a3e4271.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1887524084&fsize=39202&hid=c0a25ca329b8486f27e7db2eca2ec305&media_type=image&tknv=v2&etag=648944268689106f460e12a21fe27819&rtoken=m0tRE4KYuZWd&force_default=yes&ycrid=na-e6f41e815957a3e2c73bf4c763d28d71-downloader14e&ts=6142c990ac3c0&s=e417afd1905fb493311bb3852ad302eb7a435548e6240d1e6edd1bff8492653e&pb=U2FsdGVkX19FDf9SRQ6haeqZfIXM2XDroOfC5QurUGAgtgw4vbHVIkAHcTh9PgVe81WQBpAYupLJQWnfTPu8nNz-brVn5o_P7siVfpwwmN4'),
//               ), flex: 25,),
//               Expanded(child: Container(),flex: 5,),
//               Expanded(child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(child: Container(),flex: 10,),
//                   Expanded(flex: 30,child: Text('Кирилл Михайлович Бастрыкин', style: Theme.of(context).textTheme.titleMedium,)),
//                   Expanded(child: Text('zyxel91@gmail.com', style: Theme.of(context).textTheme.labelMedium,),flex: 15,),
//                   Expanded(child: Container(),flex: 20,)
//                 ],
//               ),flex: 70,),
//             ],
//           ),flex: 20,),
//           Expanded(child: Container(child: TextButton(style: mainButton(Colors.blueAccent),child: Text('Купить', style: Theme.of(context).textTheme.headlineMedium,), onPressed: (){},)),flex: 7,),
//           Expanded(child: YoutubePlayer(
//             controller: _youtubePlayerController,
//           ),flex: 38,),

//           Expanded(child: Container(),flex: 40)
//           ],
//         ),
//       ),
//     );
//   }
// }