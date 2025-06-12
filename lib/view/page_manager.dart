import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stitch/view/home_page.dart';
import 'package:stitch/view/identify_page.dart';
import 'package:stitch/view/my_page.dart';

// 하단 네비게이션 바로 화면을 전환하는 메인 페이지 매니저
class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  int _currentIndex = 0; // 현재 선택된 인덱스

  // 각 탭에서 보여줄 페이지 목록
  final List<Widget> pages = [
    HomePage(),     // 0: 홈
    IdentifyPage(), // 1: 검색 (식물 찾기)
    MyPage(),       // 2: 오늘의 식물
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 현재 인덱스에 해당하는 페이지를 보여줌
      body: pages[_currentIndex],

      // 하단 네비게이션 바 구성
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,       // 배경 흰색
        currentIndex: _currentIndex,         // 현재 선택된 인덱스
        onTap: (index) {
          // 탭이 눌렸을 때 상태 갱신
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // 고정형 (3개 이상 탭일 때도 전체 표시)
        selectedFontSize: 12,                // 선택된 아이템의 텍스트 크기
        selectedItemColor: Colors.black,     // 선택된 아이템 색상
        unselectedItemColor: Color(0xFF7A8A61), // 선택되지 않은 아이템 색상 (녹색 계열)

        // 바텀 네비게이션 아이템 3개 구성
        items: [
          BottomNavigationBarItem(
            icon: Icon(Symbols.home_rounded),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.photo_camera_rounded),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.psychiatry_rounded),
            label: '오늘의 식물',
          ),
        ],
      ),
    );
  }
}
