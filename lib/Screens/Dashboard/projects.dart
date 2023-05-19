import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../Data/data_model.dart';
import '../../Values/values.dart';
import '../../widgets/Buttons/primary_tab_buttons.dart';
import '../../widgets/Chat/add_chat_icon.dart';
import '../../widgets/Navigation/app_header.dart';
import '../../widgets/Projects/project_card_horizontal.dart';
import '../../widgets/Projects/project_card_vertical.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsButtonTrigger = ValueNotifier(0);
    final switchGridLayout = ValueNotifier(false);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: SafeArea(
          child: AppHeader(
            title: "Projects",
            widget: AppAddIcon(scale: 1.0),
          ),
        ),
      ),
      AppSpaces.verticalSpace20,
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //tab indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PrimaryTabButton(
                  buttonText: "Favorites",
                  itemIndex: 0,
                  notifier: settingsButtonTrigger),
              PrimaryTabButton(
                  buttonText: "Recent",
                  itemIndex: 1,
                  notifier: settingsButtonTrigger),
              PrimaryTabButton(
                  buttonText: "All",
                  itemIndex: 2,
                  notifier: settingsButtonTrigger)
            ],
          ),
          Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    switchGridLayout.value = !switchGridLayout.value;
                    // _showDashboardSettings(context);
                  },
                  child: ValueListenableBuilder(
                      valueListenable: switchGridLayout,
                      builder: (BuildContext context, _, __) {
                        return switchGridLayout.value
                            ? const Icon(FeatherIcons.clipboard,
                                color: Colors.white, size: 30)
                            : const Icon(FeatherIcons.grid,
                                color: Colors.white, size: 30);
                      })))
        ]),
      ),
      AppSpaces.verticalSpace20,
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ValueListenableBuilder(
              valueListenable: switchGridLayout,
              builder: (BuildContext context, _, __) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //change
                    crossAxisCount: switchGridLayout.value ? 2 : 1,
                    mainAxisSpacing: 10,

                    //change height 125
                    mainAxisExtent: switchGridLayout.value ? 220 : 125,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) => switchGridLayout.value
                      ? ProjectCardVertical(
                          projectName: AppData.productData[index]
                              ['projectName'],
                          category: AppData.productData[index]['category'],
                          color: AppData.productData[index]['color'],
                          ratingsUpperNumber: AppData.productData[index]
                              ['ratingsUpperNumber'],
                          ratingsLowerNumber: AppData.productData[index]
                              ['ratingsLowerNumber'],
                        )
                      : ProjectCardHorizontal(
                          projectName: AppData.productData[index]
                              ['projectName'],
                          category: AppData.productData[index]['category'],
                          color: AppData.productData[index]['color'],
                          ratingsUpperNumber: AppData.productData[index]
                              ['ratingsUpperNumber'],
                          ratingsLowerNumber: AppData.productData[index]
                              ['ratingsLowerNumber'],
                        ),
                  itemCount: AppData.productData.length,
                );
              },
            ),
          ),
        ),
      )
    ]);
  }
}
