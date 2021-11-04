import 'dart:async';

import 'package:flutter/material.dart';
import 'package:example/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Clock extends StatefulWidget {
  Clock({Key? key}) : super(key: key);

  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [HexColor('#FFFFFF'), HexColor('#F0F0F0')],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                tileMode: TileMode.clamp)),
        child: SafeArea(
          child: Center(
              child: ClockWidget(
            dateTime: dateTime,
          )),
        ),
      ),
    );
  }
}

class ClockWidget extends StatelessWidget {
  final DateTime dateTime;
  const ClockWidget({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var seconds = dateTime.second.toDouble();
    var minutes = dateTime.minute.toDouble();
    var hours = dateTime.hour.toDouble();
    return SleekCircularSlider(
      settings: settings01,
      values: CircularSliderValues(
        minimumValue: 0,
        maximumValue: 59,
        initialValue: seconds,
        startAngle: 270,
        angleRange: 360,
        size: 350.0,
        trackWidth: 2,
        progressBarWidth: 10,
      ),
      innerWidget: (double value) {
        return Align(
          alignment: Alignment.center,
          child: SleekCircularSlider(
            settings: settings02,
            values: CircularSliderValues(
              minimumValue: 0,
              maximumValue: 59,
              initialValue: minutes,
              startAngle: 270,
              angleRange: 360,
              size: 290.0,
              trackWidth: 5,
              progressBarWidth: 15,
            ),
            innerWidget: (double value) {
              return Align(
                alignment: Alignment.center,
                child: SleekCircularSlider(
                  settings: settings03,
                  values: CircularSliderValues(
                    initialValue: hours % 12,
                    minimumValue: 0,
                    maximumValue: 11,
                    startAngle: 270,
                    angleRange: 360,
                    size: 210.0,
                    trackWidth: 8,
                    progressBarWidth: 20,
                  ),
                  innerWidget: (double value) {
                    final h = hours.toInt() < 12
                        ? 'AM ${hours.toInt() % 12}'
                        : 'PM ${hours.toInt() % 12}';
                    final m = minutes.toInt() < 10
                        ? '0${minutes.toInt()}'
                        : minutes.toInt().toString();
                    final s = seconds.toInt() < 10
                        ? '0${seconds.toInt()}'
                        : seconds.toInt().toString();
                    return Center(
                        child: Text(
                      '$h : $m : $s',
                      style: TextStyle(
                          color: HexColor('#A177B0'),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ));
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

final features01 = CircularSliderFeatures(
  animationEnabled: false,
);

final colors01 = CircularSliderColors(
  dotColor: Colors.white.withOpacity(0.8),
  trackColor: HexColor('#FFD4BE').withOpacity(0.4),
  barColors: BarColorHelper.createBarColorList(HexColor('#F6A881')),
);

final shadow01 = CircularSliderShadow(
  color: HexColor('#FFD4BE'),
  step: 10.0,
  maxOpacity: 0.6,
  shadowWidth: 20,
);

final settings01 = CircularSliderSettings(
  features: features01,
  colors: colors01,
  shadow: shadow01,
);

final features02 = CircularSliderFeatures(
  animationEnabled: false,
);

final colors02 = CircularSliderColors(
  dotColor: Colors.white.withOpacity(0.8),
  trackColor: HexColor('#98DBFC').withOpacity(0.3),
  barColors: BarColorHelper.createBarColorList(HexColor('#6DCFFF')),
);

final shadow02 = CircularSliderShadow(
  color: HexColor('#98DBFC'),
  step: 15.0,
  maxOpacity: 0.3,
  shadowWidth: 30,
);

final settings02 = CircularSliderSettings(
  features: features02,
  colors: colors02,
  shadow: shadow02,
);

final features03 = CircularSliderFeatures(
  animationEnabled: false,
);

final colors03 = CircularSliderColors(
  dotColor: Colors.white.withOpacity(0.8),
  trackColor: HexColor('#EFC8FC').withOpacity(0.3),
  barColors: BarColorHelper.createBarColorList(HexColor('#A177B0')),
);

final shadow03 = CircularSliderShadow(
  color: HexColor('#EFC8FC'),
  step: 20.0,
  maxOpacity: 0.3,
  shadowWidth: 40,
);

final settings03 = CircularSliderSettings(
  features: features03,
  colors: colors03,
  shadow: shadow03,
);
