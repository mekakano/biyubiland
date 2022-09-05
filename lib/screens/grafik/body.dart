import 'package:biyubi/constants.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:biyubi/components/rounded_button.dart';
import 'package:biyubi/components/rounded_input_field.dart';
import 'package:biyubi/components/rounded_password_field.dart';
import 'package:biyubi/components/text_field_container.dart';

class HomePage extends StatefulWidget {
  final Widget? child;

  const HomePage({Key? key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var _scrollController, _tabController;
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });
  late List<charts.Series<Pollution, String>> _seriesData;
  late List<charts.Series<Task, String>> _seriesPieData;
  late List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Pollution(1980, 'USA', 30),
      new Pollution(1980, 'Asia', 40),
      new Pollution(1980, 'Europe', 10),
    ];
    var data2 = [
      new Pollution(1985, 'USA', 100),
      new Pollution(1980, 'Asia', 150),
      new Pollution(1985, 'Europe', 80),
    ];
    var data3 = [
      new Pollution(1985, 'USA', 200),
      new Pollution(1980, 'Asia', 300),
      new Pollution(1985, 'Europe', 180),
    ];

    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new Sales(0, 20, 30),
      new Sales(1, 24, 40),
      new Sales(2, 25, 50),
      new Sales(3, 40, 60),
      new Sales(4, 45, 70),
      new Sales(5, 60, 80),
    ];
    var linesalesdata1 = [
      new Sales(0, 20, 30),
      new Sales(1, 24, 40),
      new Sales(2, 25, 50),
      new Sales(3, 40, 60),
      new Sales(4, 45, 70),
      new Sales(5, 60, 80),
    ];

    var linesalesdata2 = [
      new Sales(0, 20, 30),
      new Sales(1, 24, 40),
      new Sales(2, 25, 50),
      new Sales(3, 40, 60),
      new Sales(4, 45, 70),
      new Sales(5, 60, 80),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 7);
    _seriesData = <charts.Series<Pollution, String>>[];
    _seriesPieData = <charts.Series<Task, String>>[];
    _seriesLineData = <charts.Series<Sales, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // title: Text(widget.title),
              pinned: true,
              floating: true,
              snap: false,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                isScrollable: true,
                tabs: <Tab>[
                  Tab(
                    icon: Icon(FontAwesomeIcons.solidChartBar),
                  ),
                  Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                  Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                  Tab(
                    child: Text('Current Balance'),
                  ),
                  Tab(
                    child: Text('Tab 5'),
                  ),
                  Tab(
                    child: Text('Tab 6'),
                  ),
                  Tab(
                    child: Text('Tab 7'),
                  )
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'SO₂ emissions, by world region (in million tonnes)',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: charts.BarChart(
                          _seriesData,
                          animate: true,
                          barGroupingType: charts.BarGroupingType.grouped,
                          //behaviors: [new charts.SeriesLegend()],
                          animationDuration: Duration(seconds: 5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                // width: double.infinity,
                child: Center(
                    child: Column(children: <Widget>[
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          // The red line
                          LineChartBarData(
                            spots: dummyData1,
                            isCurved: true,
                            barWidth: 3,
                            colors: [
                              Colors.red,
                            ],
                          ),
                          // The orange line
                          LineChartBarData(
                            spots: dummyData2,
                            isCurved: true,
                            barWidth: 3,
                            colors: [
                              Colors.orange,
                            ],
                          ),
                          // The blue line
                          LineChartBarData(
                            spots: dummyData3,
                            isCurved: true,
                            barWidth: 3,
                            colors: [
                              Colors.blue,
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ])),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Sales for the first 5 years',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: charts.LineChart(_seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                              includeArea: false,
                              stacked: true,
                              includeLine: true,
                              includePoints: true,
                            ),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.RangeAnnotation([
                                new charts.RangeAnnotationSegment(0.5, 1.0,
                                    charts.RangeAnnotationAxisType.domain,
                                    startLabel: 'Domain 1'),
                                new charts.RangeAnnotationSegment(
                                  15,
                                  200,
                                  charts.RangeAnnotationAxisType.measure,
                                  startLabel: 'Measure 1 Start',
                                  endLabel: 'Measure 1 End',
                                ),
                              ]),
                              new charts.ChartTitle('Years',
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              new charts.ChartTitle('Sales',
                                  behaviorPosition:
                                      charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              new charts.ChartTitle(
                                'Departments',
                                behaviorPosition: charts.BehaviorPosition.end,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                              )
                            ]),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 4'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 5'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 6'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 7'),
              ),
            ),
          ],
        ),
      ),
    );
    // MaterialApp(
    //   home: DefaultTabController(
    //     length: 6,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: kPrimaryColor,
    //         bottom: TabBar(
    //           isScrollable: true,
    //           // indicatorColor: Color(0xff9962D0),
    //           tabs: [
    //             Tab(
    //               icon: Icon(FontAwesomeIcons.solidChartBar),
    //             ),
    //             Tab(icon: Icon(FontAwesomeIcons.chartPie)),
    //             Tab(icon: Icon(FontAwesomeIcons.chartLine)),
    //             Tab(
    //               child: Text('Current Balance'),
    //             ),
    //             Tab(
    //               child: Text('Tab 5'),
    //             ),
    //             Tab(
    //               child: Text('Tab 6'),
    //             )
    //           ],
    //         ),
    //         title: Text('Flutter Charts'),
    //       ),
    //       body: TabBarView(
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.all(8.0),
    //             child: Container(
    //               child: Center(
    //                 child: Column(
    //                   children: <Widget>[
    //                     Text(
    //                       'SO₂ emissions, by world region (in million tonnes)',
    //                       style: TextStyle(
    //                           fontSize: 24.0, fontWeight: FontWeight.bold),
    //                     ),
    //                     Expanded(
    //                       child: charts.BarChart(
    //                         _seriesData,
    //                         animate: true,
    //                         barGroupingType: charts.BarGroupingType.grouped,
    //                         //behaviors: [new charts.SeriesLegend()],
    //                         animationDuration: Duration(seconds: 5),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.all(8.0),
    //             child: Container(
    //               padding: const EdgeInsets.only(right: 16.0, left: 6.0),
    //               width: double.infinity,
    //               child: LineChart(
    //                 LineChartData(
    //                   borderData: FlBorderData(show: false),
    //                   lineBarsData: [
    //                     // The red line
    //                     LineChartBarData(
    //                       spots: dummyData1,
    //                       isCurved: true,
    //                       barWidth: 3,
    //                       colors: [
    //                         Colors.red,
    //                       ],
    //                     ),
    //                     // The orange line
    //                     LineChartBarData(
    //                       spots: dummyData2,
    //                       isCurved: true,
    //                       barWidth: 3,
    //                       colors: [
    //                         Colors.orange,
    //                       ],
    //                     ),
    //                     // The blue line
    //                     LineChartBarData(
    //                       spots: dummyData3,
    //                       isCurved: true,
    //                       barWidth: 3,
    //                       colors: [
    //                         Colors.blue,
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.all(8.0),
    //             child: Container(
    //               child: Center(
    //                 child: Column(
    //                   children: <Widget>[
    //                     Text(
    //                       'Sales for the first 5 years',
    //                       style: TextStyle(
    //                           fontSize: 24.0, fontWeight: FontWeight.bold),
    //                     ),
    //                     Expanded(
    //                       child: charts.LineChart(_seriesLineData,
    //                           defaultRenderer: new charts.LineRendererConfig(
    //                             includeArea: false,
    //                             stacked: true,
    //                             includeLine: true,
    //                             includePoints: true,
    //                           ),
    //                           animate: true,
    //                           animationDuration: Duration(seconds: 5),
    //                           behaviors: [
    //                             new charts.RangeAnnotation([
    //                               new charts.RangeAnnotationSegment(0.5, 1.0,
    //                                   charts.RangeAnnotationAxisType.domain,
    //                                   startLabel: 'Domain 1'),
    //                               new charts.RangeAnnotationSegment(
    //                                 15,
    //                                 200,
    //                                 charts.RangeAnnotationAxisType.measure,
    //                                 startLabel: 'Measure 1 Start',
    //                                 endLabel: 'Measure 1 End',
    //                               ),
    //                             ]),
    //                             new charts.ChartTitle('Years',
    //                                 behaviorPosition:
    //                                     charts.BehaviorPosition.bottom,
    //                                 titleOutsideJustification: charts
    //                                     .OutsideJustification.middleDrawArea),
    //                             new charts.ChartTitle('Sales',
    //                                 behaviorPosition:
    //                                     charts.BehaviorPosition.start,
    //                                 titleOutsideJustification: charts
    //                                     .OutsideJustification.middleDrawArea),
    //                             new charts.ChartTitle(
    //                               'Departments',
    //                               behaviorPosition: charts.BehaviorPosition.end,
    //                               titleOutsideJustification: charts
    //                                   .OutsideJustification.middleDrawArea,
    //                             )
    //                           ]),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Container(
    //             child: Center(
    //               child: Text('Tab 4'),
    //             ),
    //           ),
    //           Container(
    //             child: Center(
    //               child: Text('Tab 5'),
    //             ),
    //           ),
    //           Container(
    //             child: Center(
    //               child: Text('Tab 6'),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;
  int cobaval;

  Sales(this.yearval, this.salesval, this.cobaval);
}
