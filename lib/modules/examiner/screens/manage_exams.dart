import 'package:cbt_platform/core/app_constants.dart';
import 'package:cbt_platform/theme/app_colors.dart';
import 'package:cbt_platform/theme/text_style_util.dart';
import 'package:cbt_platform/utilities/margin_util.dart';
import 'package:cbt_platform/utilities/widgets/custom_button.dart';
import 'package:flutter/material.dart';

List dummyData = [
  {
    "Examination Date": "21/08/2022, 7:30 am",
    "Candidates’ Level": "400",
    "Course Code": "CSC 402",
    "College": "Applied Sciences"
  },
  {
    "Examination Date": "21/08/2022, 7:30 am",
    "Candidates’ Level": "300",
    "Course Code": "ZLY 306",
    "College": "Basic Sciences"
  },
  {
    "Examination Date": "21/08/2022, 7:30 am",
    "Candidates’ Level": "200",
    "Course Code": "AGY 208",
    "College": "Agriculture"
  },
  {
    "Examination Date": "21/08/2022, 7:30 am",
    "Candidates’ Level": "100",
    "Course Code": "TCS 112",
    "College": "Applied Sciences"
  },
  {
    "Examination Date": "21/08/2022, 7:30 am",
    "Candidates’ Level": "PG(MSC)",
    "Course Code": "PG MBA Cert 1",
    "College": "Business & Finance"
  }
];

class Manage extends StatefulWidget {
  static const String routeName = "/manage";
  const Manage({super.key});

  @override
  State<Manage> createState() => _ManageState();
}

class _ManageState extends State<Manage> {
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
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 103),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(58),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Manage your exam questions and times",
                  style: semiBoldStyle(20, AppColors.black1E),
                ),
                Button(
                    text: "Upload a new exam",
                    borderRadius: 50,
                    width: 172,
                    function: () {})
              ],
            ),
            const YMargin(60),
            DataTable(
                dataRowHeight: 70,
                columnSpacing: 130,
                columns: [
                  DataColumn(
                    label: Text(
                      "Examination Date",
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
                      "Course Code",
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
                    label: Text("test"),
                  )
                ],
                rows: List.generate(dummyData.length, (index) {
                  final item = dummyData[index];
                  return DataRow(cells: [
                    DataCell(
                      Text(
                        item["Examination Date"],
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
                        item["Course Code"],
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
