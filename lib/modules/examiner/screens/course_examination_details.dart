import 'package:cbt_platform/core/app_constants.dart';
import 'package:cbt_platform/theme/app_colors.dart';
import 'package:cbt_platform/theme/text_style_util.dart';
import 'package:cbt_platform/utilities/margin_util.dart';
import 'package:cbt_platform/utilities/widgets/custom_button.dart';
import 'package:cbt_platform/utilities/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

List dummyData = [
  {
    "Student's name": "Stephen Leroy",
    "Candidates’ Level": "400",
    "College": "Basic Sciences"
  },
  {
    "Student's name": "Dada Desoye",
    "Candidates’ Level": "400",
    "College": "Agriculture"
  },
  {
    "Student's name": "Michael Kareem",
    "Candidates’ Level": "400",
    "College": "Applied Sciences"
  },
  {
    "Student's name": "Jordan Abdulgafaar",
    "Candidates’ Level": "400",
    "College": "Business & Finance"
  }
];

class ExamDetails extends StatefulWidget {
  static const String routeName = "/examdetails";
  const ExamDetails({super.key});

  @override
  State<ExamDetails> createState() => _ExamDetailsState();
}

class _ExamDetailsState extends State<ExamDetails> {
  final option1 = TextEditingController();
  final option2 = TextEditingController();
  final option3 = TextEditingController();
  final option4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth(context, percent: 0.056)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.schoolNameSec,
                style: boldStyle(20, AppColors.black),
              ),
              Text(
                "Computer Based Test (CBT) 2023",
                style: normalStyle(14, AppColors.grey7c),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 103),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Course Examination Details",
                  style: semiBoldStyle(20, AppColors.black1E),
                ),
                Row(
                  children: [
                    Button(
                        text: "Edit exam details",
                        borderRadius: 50,
                        width: 172,
                        function: () {}),
                    const XMargin(20),
                    Button(
                        text: "Manage exam questions",
                        width: 172,
                        borderRadius: 50,
                        function: () {})
                  ],
                )
              ],
            ),
            const YMargin(47),
            Row(
              children: [
                CustomTextField(
                  controller: option1,
                  title: "Course Name",
                  hintText: "Introduction to Human Computer Interaction",
                  width: screenWidth(context, percent: 0.264),
                ),
                const XMargin(153),
                CustomTextField(
                  controller: option2,
                  title: "Course code",
                  hintText: "CSC 402",
                  width: screenWidth(context, percent: 0.264),
                )
              ],
            ),
            const YMargin(40),
            Row(
              children: [
                CustomTextField(
                  controller: option3,
                  title: "What level is this exam for?",
                  hintText: "400 level students",
                  height: 1,
                  width: screenWidth(context, percent: 0.264),
                ),
                const XMargin(153),
                CustomTextField(
                  controller: option4,
                  title: "Faculty",
                  hintText: "Faculty of Applied Sciences",
                  width: screenWidth(context, percent: 0.264),
                )
              ],
            ),
            const YMargin(50),
            Text(
              "View all Students taking this exam",
              style: semiBoldStyle(20, AppColors.black1E),
            ),
            const YMargin(30),
            DataTable(
                dataRowHeight: 60,
                columnSpacing: 130,
                columns: [
                  DataColumn(
                    label: Text(
                      "Student's name",
                      style: semiBoldStyle(20, AppColors.grey7c),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Candidates’ Level",
                      style: semiBoldStyle(20, AppColors.grey7c),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "College",
                      style: semiBoldStyle(20, AppColors.grey7c),
                    ),
                  ),
                  const DataColumn(
                    label: Text(""),
                  )
                ],
                rows: List.generate(dummyData.length, (index) {
                  final item = dummyData[index];
                  return DataRow(cells: [
                    DataCell(
                      Text(
                        item["Student's name"],
                        style: normalStyle(14, AppColors.grey7c),
                      ),
                    ),
                    DataCell(
                      Text(
                        item["Candidates’ Level"],
                        style: normalStyle(14, AppColors.grey7c),
                      ),
                    ),
                    DataCell(
                      Text(
                        item["College"],
                        style: normalStyle(14, AppColors.grey7c),
                      ),
                    ),
                    DataCell(
                      Text(
                        "view Details",
                        style: normalStyle(14, AppColors.brandBlue),
                      ),
                    ),
                  ]);
                }))
          ],
        ),
      ),
    );
  }
}
