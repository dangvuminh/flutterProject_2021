import 'package:flutter/material.dart';

class DownloadTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Text(
                'Downloads',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),

        Row(
          children: [
            Text('Downloads'),
            Text('Remove all'),
          ],
        )
      ],
    );
  }
}
