import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 홈 페이지 위젯 정의
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 전체 배경색
      appBar: AppBar(
        backgroundColor: Colors.white, // 앱바 배경색
        title: Text(
          '홈', // 앱바 제목
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView( // 세로 스크롤 가능한 본문
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // 좌우 16, 상하 20 패딩
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "내 식물" 섹션 제목
              Text(
                '내 식물',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // 가로로 스크롤되는 식물 카드 리스트
              SizedBox(
                height: 231, // 전체 카드 높이
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal, // 가로 스크롤
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 식물 이미지 (Placeholder Container)
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: CupertinoColors.inactiveGray, // 이미지 대체용 색상
                            borderRadius: BorderRadius.circular(12), // 둥근 모서리
                          ),
                        ),
                        const SizedBox(height: 16),
                        // 식물 이름
                        Text('Monstera', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 8),
                        // 식물 카테고리
                        Text(
                          'Indoor',
                          style: TextStyle(
                            color: Color(0xFF7A8A61),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12); // 카드 간 간격
                  },
                  itemCount: 3, // 총 3개의 카드
                ),
              ),

              const SizedBox(height: 20),

              // "Featured" 섹션 제목
              Text(
                'Featured',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // 추천 식물 리스트
              ListView.builder(
                shrinkWrap: true, // 내부 Column에 맞게 크기 조정
                physics: const NeverScrollableScrollPhysics(), // ListView 자체는 스크롤 안 함
                itemCount: 2, // 추천 식물 2개
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24), // 카드 사이 간격
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 왼쪽 텍스트 설명 영역
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Plant of the Month',
                                style: TextStyle(
                                  color: Color(0xFF7A8A61),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Monstera',
                                style: TextStyle(
                                  color: Color(0xFF7A8A61),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'This tropical plant is known for its large, glossy leaves with unique holes and splits. It\'s a popular choice for indoor spaces, adding a touch of lush greenery.',
                                style: TextStyle(
                                  color: Color(0xFF7A8A61),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        // 오른쪽 이미지 (Placeholder)
                        Container(
                          width: 130,
                          height: 175,
                          decoration: BoxDecoration(
                            color: CupertinoColors.inactiveGray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
