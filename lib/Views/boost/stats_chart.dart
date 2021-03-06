import 'package:dormant_bitcoin_seeker_flutter/Stats/types.dart';
import 'package:dormant_bitcoin_seeker_flutter/Stats/wallet_stats.dart';
import 'package:dormant_bitcoin_seeker_flutter/global.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../Stats/wallet_stats_utils.dart';

class StatsChart extends StatefulWidget {
  const StatsChart(
      {Key? key, required this.chartType, required this.chartValue})
      : super(key: key);

  final double chartValue;
  final ChartType chartType;

  @override
  State<StatsChart> createState() => _StatsChartState();
}

class _StatsChartState extends State<StatsChart> {
  double divider = 0;

  @override
  void initState() {
    divider = widget.chartType == ChartType.BPS ? MAX_BPS : MAX_WPS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: CircularPercentIndicator(
        header: Container(
            width: 200,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              WalletStatsUtils.getChartTitle(widget.chartType),
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            )),
        radius: 70,
        lineWidth: 10.0,
        animation: true,
        percent: widget.chartValue / divider,
        center: Text(
          widget.chartValue.toString(),
          style: const TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        backgroundColor: Colors.grey,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: balanceColor,
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
