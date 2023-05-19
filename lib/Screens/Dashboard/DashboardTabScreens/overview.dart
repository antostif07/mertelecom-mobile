import 'package:flutter/material.dart';

import '../../../Values/values.dart';
import '../../../widgets/Dashboard/overview_task_container.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dynamic data = AppData.progressIndicatorList;
    //
    // List<Widget> cards = List.generate(
    //     5,
    //     (index) => TaskProgressCard(
    //           cardTitle: data[index]['cardTitle'],
    //           rating: data[index]['rating'],
    //           progressFigure: data[index]['progress'],
    //           percentageGap: int.parse(data[index]['progressBar']),
    //         ));

    return Column(
      children: [
        // SizedBox(
        //   height: 150,
        //   child: TCard(
        //     cards: cards,
        //   ),
        // ),
        AppSpaces.verticalSpace10,
        Column(
          children: [
            OverviewTaskContainer(
                cardTitle: "Total Sites",
                numberOfItems: "0",
                imageUrl: "assets/orange_pencil.png",
                backgroundColor: HexColor.fromHex("EFA17D")),
            OverviewTaskContainer(
                cardTitle: "Sites Completed",
                numberOfItems: "0",
                imageUrl: "assets/green_pencil.png",
                backgroundColor: HexColor.fromHex("7FBC69")),
          ],
        ),
      ],
    );
  }
}
