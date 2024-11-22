import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: SafeArea(
        //  시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          //  위, 아래 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // 반대 축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(

              //  하트 눌렀을때 실행할 함수 전달하기
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed(){  //  하트 눌렀을때 실행할 함수
    showCupertinoDialog(  //  쿠퍼티노 다이얼로그 실행
      context: context,
      builder: (BuildContext context) {
        return Align(  //  정렬을 지정하는 위젯
          alignment: Alignment.bottomCenter,  //  아래 중간으로 정렬
          child: Container(
            color: Colors.white,  // 배경색 흰색 지정
            height: 300,  // 높이 300 지정
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  const _DDay({
    required this.onHeartPressed,  //  상위에서 함수 입력받기
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          // 최상단 U&I 글자
          'U&I',
          style: textTheme.displayLarge,
        ),
        const SizedBox(height: 16.0),
        Text(
          // 두번째 글자
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        Text(
          // 임시로 지정한 만난 날짜
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 16.0),
        IconButton(
          // 하트 아이콘 버튼
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          // 만난 후 DDay
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Expanded 추가
      child: Center(
        //  이미지 중앙정렬
        child: Image.asset(
          'asset/img/middle_image.png',

          // 화면의 반만큼 높이 구현
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   DateTime firstDay = DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.pink.shade100,
//         body: SafeArea(
//             top: true,
//             bottom: false,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 _DDay(
//                   onHeartPressed: onHeartPressed,
//                   firstDay: firstDay,
//                 ),
//                 _CoupleImage(),
//               ],
//             )));
//   }
//   void onHeartPressed(){  //  하트 눌렀을때 실행할 함수
//     showCupertinoDialog(  //  쿠퍼티노 다이얼로그 실행
//       context: context,
//       builder: (BuildContext context) {
//         return Align(  //  정렬을 지정하는 위젯
//           alignment: Alignment.bottomCenter,  //  아래 중간으로 정렬
//           child: Container(
//             color: Colors.white,  // 배경색 흰색 지정
//             height: 300,  // 높이 300 지정
//             child: CupertinoDatePicker(
//               mode: CupertinoDatePickerMode.date,
//               onDateTimeChanged: (DateTime date) {
//                 setState(() {
//                   firstDay = date;
//                 });
//               },
//             ),
//           ),
//         );
//       },
//       barrierDismissible: true,
//     );
//   }
// }

 



// class _DDay extends StatelessWidget {
//   final GestureTapCallback onHeartPressed;
//   final DateTime firstDay;
//   const _DDay(
//       {required this.onHeartPressed, required this.firstDay //  상위에서 함수 입력받기
//       });

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final now = DateTime.now();
//     return Column(
//       children: [
//         const SizedBox(
//           height: 16.0,
//         ),
//         Text(
//           'U&I',
//           style: textTheme.displayLarge,
//         ),
//         const SizedBox(height: 16.0),
//         Text(
//           '우리 처음 만날 날',
//         ),
//            Text(
//           '${firstDay.year}.${firstDay.month}.${firstDay.day}',
//           style: textTheme.bodyMedium,
//         ),
//         const SizedBox(
//           height: 16.0,
//         ),
//         IconButton(
//             iconSize: 60.0,
//             onPressed: onHeartPressed,
//             icon: Icon(
//               Icons.favorite,
//               color: Colors.red.shade600,
//             )),
//         const SizedBox(
//           height: 16.0,
//         ),
//         Text(
//           // 만난 후 DDay
//           'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
//           style: textTheme.displayMedium,
//         ),
//       ],
//     );
//   }
// }

// class _CoupleImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       // Expanded 추가
//       child: Center(
//         //  이미지 중앙정렬
//         child: Image.asset(
//           'asset/img/middle_image.png',

//           // 화면의 반만큼 높이 구현
//           height: MediaQuery.of(context).size.height / 2,
//         ),
//       ),
//     );
//   }
// }