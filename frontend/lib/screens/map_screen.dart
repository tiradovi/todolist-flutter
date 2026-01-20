/*
lib
├────widgets/
│     ├────location_info_widget.dart            # 장소 정보         장소이름, 주소, 버튼들
│     ├────action_button.dart                   # 액션 버튼(재사용)
│     ├────map_widget.dart                      # 지도 view         Google Map iframe WebView
│     ├────transport_info_widget.dart           # 교통 정보         대중교통 정보 컨데이너
│     └────transport_info_item.dart             # 교통 정보 아이템 (재사용)
└────screen/
      └────map_screen.dart   # 메인 페이지
 *//*


import 'package:flutter/material.dart';

import '../widgets/map/html_map_widget.dart';
import '../widgets/map/location_info_widget.dart';
import '../widgets/map/transport_info_widget.dart';

class MapScreen  extends StatelessWidget{
  const MapScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("오시는 길"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: const Column(
        children: [LocationInfoWidget(),
          Expanded(child: HtmlMapWidget()),
          TransportInfoWidget()],
      ),
    );
  }
}*/
