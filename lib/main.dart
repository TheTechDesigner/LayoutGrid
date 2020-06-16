import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

const _bgColor = Color(0xFFFBE0E6);
const _color1 = Color(0xFFC41A3B);
const _color2 = Color(0xFF1B1F32);
const _color3 = Colors.orangeAccent;
const _color4 = Colors.purpleAccent;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Grid Layout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: _bgColor,
        child: LayoutGrid(
          columnGap: 12,
          rowGap: 12,
          templateColumnSizes: [
            FlexibleTrackSize(1),
            FlexibleTrackSize(3.5),
            FlexibleTrackSize(1),
            FlexibleTrackSize(1),
            FlexibleTrackSize(1),
          ],
          templateRowSizes: [
            FlexibleTrackSize(1),
            FlexibleTrackSize(0.3),
            FlexibleTrackSize(1),
            FlexibleTrackSize(1),
          ],
          children: <Widget>[
            // Column 1
            _buildItem(_color2).withGridPlacement(
              columnStart: 0,
              rowStart: 0,
              rowSpan: 2,
            ),
            _buildItem(_color1).withGridPlacement(
              columnStart: 0,
              rowStart: 2,
              rowSpan: 2,
            ),
            // Column 2
            _buildItem(_color3).withGridPlacement(
              columnStart: 1,
              rowStart: 0,
              rowSpan: 4,
            ),
            // Column 3
            _buildItem(_color4).withGridPlacement(
              columnStart: 2,
              columnSpan: 3,
              rowStart: 0,
            ),
            _buildItem(_color1).withGridPlacement(
              columnStart: 2,
              columnSpan: 3,
              rowStart: 1,
              rowSpan: 2,
            ),
            _buildItem(_color2).withGridPlacement(
              columnStart: 2,
              rowStart: 3,
            ),
            // Column 4
            _buildItem(_color4).withGridPlacement(
              columnStart: 3,
              rowStart: 3,
            ),
            // Column 5
            _buildItem(_color3).withGridPlacement(
              columnStart: 4,
              rowStart: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Color _color) => SizedBox.expand(
          child: DecoratedBox(
        decoration: BoxDecoration(color: _color),
      ));
}
