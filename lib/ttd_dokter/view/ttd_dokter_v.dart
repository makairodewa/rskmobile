import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/ttd_dokter/controller/ttd_dokter_c.dart';

class TtdDokterPage extends GetView<TtdDokterController> {
  const TtdDokterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Resume Pasien')),
        body: const SafeArea(child: Text('TtdDokterController')));
  }
}
