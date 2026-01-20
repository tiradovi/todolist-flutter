import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontScreen extends StatelessWidget {
  const FontScreen({super.key});
/*
*
* 글자 내부 그래디언트 적용 컬러의 경우
* Theme로 그래디언트를 설정하여 그래디언트 완성 커스텀 클래스나
* 컬러디자인을 따로 만든 후 호출하지 않는 한 사용 직접적으로 하는 것 지양
* web에서는 그래디언트가 적용되는 것처럼 보이지만
* 어플에서는 적용되지 않음
*
* 정~~~~말로 원해서 사용하고자 한다면
* simple_gradient_text or gradient_borders 와 유사한 모듈들 존재
* 이 모듈을 사용해서 텍스트 글자 내부에 그래디언트를 줄 수 있음
*
* 그래디언트 의 경우 글자 color가 아니라 image로 들어가는 색상 설정!이므로
* 아무리~~~Color 컬러에 넣어도 되지 않는다.
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Font 모음',
            style: GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('로보트 글자',
                style: GoogleFonts.roboto(
                    fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            /*
              TextStyle(
                fontFamily: 'Rubik Storm',
                fontSize: 18,
                fontVariations: [
                  FontVariation('ital', 0),
                  FontVariation('wght', 400)
                ],
              ),
             */
            /* 영어 전용 폰트는 영어로 작성된 문자나 숫자만 가능하다. */
            Text('Rubik English Font',
                style: GoogleFonts.rubikStorm(
                    fontSize: 32, fontWeight: FontWeight.w400)),
            Text('Honk English Font',
                style: GoogleFonts.honk(
                    fontSize: 32, fontWeight: FontWeight.w400)),
            Text('Honk English Font',
                style: GoogleFonts.honk(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.pink)),
            // 그래디언트의 경우 모듈을 사용하여 적용하기 ShaderMask 기본모델은 버그가 많음!
            ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(colors: [
                  Color(0xFFFF6984),
                  Color(0xFFFF1493),
                  Color(0xFFC71585),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                    .createShader(bounds),
                child: Text('Honk English Font',
                    style: GoogleFonts.honk(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      /* shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(3, 3),
                              blurRadius: 8)
                        ]*/))),
          ],
        ),
      ),
      // Theme 속성을 이용해서 폰트 추가
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.font_download), label: '폰트'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
      ], currentIndex: 1, onTap: (index) {}),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('버튼을 눌렀습니다.',
                  style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      fontSize: 24))))
          //  content: Text('버튼을 눌렀습니다.', style: GoogleFonts.notoSans())))
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Text('메뉴',
                  style: GoogleFonts.notoSans(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                '홈',
                style: GoogleFonts.roboto(),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.font_download),
              title: Text(
                '폰트',
                style: GoogleFonts.lato(),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                '설정',
                style: GoogleFonts.openSans(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}