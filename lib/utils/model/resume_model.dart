class ResumeModel {
  final String norawat;
  final String nama;
  final String norm;

  ResumeModel({required this.norawat, required this.nama, required this.norm});
  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      norawat: json['no_rawat'] ?? "",
      nama: json['nm_pasien'] ?? "",
      norm: json['no_rkm_medis'] ?? "",
    );
  }
  static List<ResumeModel> getResume() {
    List<ResumeModel> resumes = [];
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    resumes.add(ResumeModel(norawat: "10000", nama: "Yakub", norm: "2324"));
    return resumes;
  }
}
