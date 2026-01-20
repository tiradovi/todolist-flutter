import 'package:flutter/material.dart';
import 'package:frontend/widgets/map/transport_info_item.dart';

class TransportInfoWidget extends StatelessWidget {
  const TransportInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey[50],
          border: Border(top: BorderSide(color: Colors.grey[300]!))),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "대중교통",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 12),
          TransportInfoItem(
              icon: Icons.subway, title: '지하철', info: '7호선 청담역 8번 출구 보도 5분'),
          SizedBox(height: 12),
          TransportInfoItem(
              icon: Icons.directions_bus,
              title: '버스',
              info: '간선 143, 148 / 지선 3414, 4314')
        ],
      ),
    );
  }
}
