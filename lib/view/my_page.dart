import 'package:flutter/material.dart';

// "오늘의 식물" 정보를 보여주는 페이지
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색 흰색
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '오늘의 식물', // 앱바 제목
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // 상단 이미지 영역
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // 둥근 이미지 모서리
              child: Stack(
                children: [
                  // 식물 이미지 (대체 이미지 필요)
                  Image.asset(
                    'assets/plant_placeholder.png',
                    fit: BoxFit.cover, // 이미지 비율 유지하면서 영역 채우기
                  ),
                  // 우측 상단 이모지 배지
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2), // 그림자 방향
                          )
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xFFB6E4FF), // 밝은 파랑 배경
                        child: Text("🥲", style: TextStyle(fontSize: 16)), // 이모지
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // 식물 이름
          const Text(
            'Lucky Bamboo',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          // 설명 텍스트
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'This plant is known for bringing good fortune and prosperity. '
                  'May your day be filled with positive energy and success!',
              style: TextStyle(fontSize: 15, color: Colors.black87),
              textAlign: TextAlign.center, // 중앙 정렬
            ),
          ),
        ],
      ),
    );
  }
}
