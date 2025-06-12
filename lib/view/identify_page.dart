import 'dart:html' as html; // 웹에서 파일 업로드 기능을 사용하기 위한 html 패키지
import 'package:flutter/material.dart';

// 식물 이미지를 업로드하여 식별하는 IdentifyPage
class IdentifyPage extends StatefulWidget {
  const IdentifyPage({super.key});

  @override
  State<IdentifyPage> createState() => _IdentifyPageState();
}

class _IdentifyPageState extends State<IdentifyPage> {
  // 사용자가 업로드한 이미지의 URL을 저장
  String? imageUrl;

  // 이미지를 선택하는 함수 (웹 전용)
  void _pickImage() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement(); // 파일 업로드 입력 생성
    uploadInput.accept = 'image/*'; // 이미지 파일만 허용
    uploadInput.click(); // 파일 선택 다이얼로그 표시

    uploadInput.onChange.listen((e) {
      final file = uploadInput.files?.first;
      if (file != null) {
        final reader = html.FileReader();
        reader.readAsDataUrl(file); // 이미지를 base64 URL로 읽기

        // 읽기 완료 후 imageUrl 상태 업데이트
        reader.onLoadEnd.listen((event) {
          setState(() {
            imageUrl = reader.result as String?;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3), // 페이지 배경색
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '식물 찾기', // 앱바 제목
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // 이미지를 표시하는 영역
          Expanded(
            child: Center(
              child: imageUrl != null
                  ? Image.network(imageUrl!) // 선택된 이미지 표시
                  : Placeholder(), // 기본 placeholder 표시
            ),
          ),
          const SizedBox(height: 16),

          // 이미지 업로드 버튼
          Center(
            child: GestureDetector(
              onTap: _pickImage, // 탭 시 이미지 선택 함수 실행
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFCFECC9), // 버튼 배경색 (연녹색)
                  shape: BoxShape.circle, // 원형 버튼
                ),
                child: const Icon(
                  Icons.image_outlined, // 이미지 아이콘
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32), // 하단 여백
        ],
      ),
    );
  }
}
