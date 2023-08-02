class PlusCodeModel {
  final String globalCode;
  final String? compoundCode;

  PlusCodeModel({
    required this.globalCode,
    this.compoundCode,
  });

  factory PlusCodeModel.fromJson(Map<String, dynamic> json) {
    return PlusCodeModel(
      globalCode: json['global_code'],
      compoundCode: json['compound_code'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "global_code": globalCode,
      "compound_code": compoundCode,
    };
  }
}
