/*
modelo para crear categorias
*/
class CreateCategoryModels {
  final String categorieColor;
  final String categorieId;
  final String categorieName;
  final String keyId;

  CreateCategoryModels({
    required this.categorieColor,
    required this.categorieId,
    required this.categorieName,
    required this.keyId,
  });

  factory CreateCategoryModels.fromJson(Map<String, dynamic> json) {
    return CreateCategoryModels(
      categorieColor: json['categorie_color'] ?? '',
      categorieId: json['categorie_id'] ?? '',
      categorieName: json['categorie_name'] ?? '',
      keyId: json['key_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categorie_color': categorieColor,
      'categorie_id': categorieId,
      'categorie_name': categorieName,
      'key_id': keyId,
    };
  }
}
