import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // 현재 기기의 여러 상태 정보를 알 수 있는 MediaQuery
    Size screenSize = MediaQuery.of(context).size;

    // 이후 높이, 패딩, 폰트 사이즈에 대해 상수를 쓰지 않고 width와 height에 곱한 값을 활용할 수 있음
    double width = screenSize.width;
    double height = screenSize.height;

    // SafeArea: 기기의 상단 노티 바 부분, 하단 영역을 침범하지 않는 안전한 영역을 잡아주는 위젯
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
          // leading을 비워두면 AppBar 좌측에 있는 버튼을 지우는 효과
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/quiz.jpeg',
                width: width * 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              '플러터 퀴즈 앱',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '퀴즈를 풀기 전 안내사항입니다. \n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
            _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n다음 문제 버튼을 눌러주세요.'),
            _buildStep(width, '3. 만점을 향해 도전해보세요!'),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple, // 버튼의 텍스트 색상
                      minimumSize:
                          Size(width * 0.8, height * 0.05), // 버튼의 최소 크기
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('지금 퀴즈 풀기'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.028,
        width * 0.024,
        width * 0.048,
        width * 0.024,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}
