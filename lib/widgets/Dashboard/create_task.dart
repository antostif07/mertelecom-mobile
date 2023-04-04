import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Values/values.dart';
import 'package:mer_group_app/widgets/BottomSheets/bottom_sheet_holder.dart';

class CreateTaskBottomSheet extends StatelessWidget {
  TextEditingController _taskNameController = new TextEditingController();

  CreateTaskBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppSpaces.verticalSpace10,
          BottomSheetHolder(),
          AppSpaces.verticalSpace10,
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.contacts, color: Colors.white,),
                    AppSpaces.horizontalSpace10,
                    Text("Unity Dashboard", style: GoogleFonts.lato(
                      color: Colors.white, fontWeight: FontWeight.w700
                    ),),
                    Icon(Icons.expand_more, color: Colors.white,)
                  ],
                ),
                AppSpaces.verticalSpace20,
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(colors: [HexColor.fromHex("fd916e"), HexColor.fromHex("ffe09b")])
                      ),
                    ),
                    AppSpaces.horizontalSpace20,
                    // Expanded(
                    //   child: UnlabelledFormInput(
                    //     placeholder: "Task Name ....",
                    //     autoFocus: true,
                    //     controller: _taskNameController,
                    //     obscureText: false
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}