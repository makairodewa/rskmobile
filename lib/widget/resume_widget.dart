import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/routes/app_routes.dart';
import 'package:rsk/utils/model/resume_model.dart';

class ResumeData extends StatelessWidget {
  const ResumeData({required this.data, required this.isDokter});

  final ResumeModel data;
  final bool isDokter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        isThreeLine: true,
        style: ListTileStyle.list,
        title: Text(data.norawat),
        onTap: () {
          Get.toNamed(
            isDokter ? AppRoutes.DETAILRESUMEDOKTER : AppRoutes.DETAILRESUME,
            arguments: data.norawat,
          );
        },
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.norm),
            Text(data.nama),
          ],
        ),
      ),
    );
  }
}
