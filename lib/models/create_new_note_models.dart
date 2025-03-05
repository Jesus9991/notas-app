/*
MODELO: para crear una nueva nota
*/
class CreateNewNoteModels {
  final String categorieColor;
  final String categorieId;
  final String categorieName;
  final String createdTime;
  final String description;
  final String keyId;
  final String title;
  final bool pinned;
  final bool allcategorie;

  CreateNewNoteModels({
    required this.categorieColor,
    required this.categorieId,
    required this.categorieName,
    required this.createdTime,
    required this.description,
    required this.keyId,
    required this.pinned,
    required this.title,
    required this.allcategorie,
  });

  factory CreateNewNoteModels.fromJson(Map<String, dynamic> json) {
    return CreateNewNoteModels(
      categorieColor: json['categorie_color'] ?? '',
      categorieId: json['categorie_id'] ?? '',
      categorieName: json['categorie_name'] ?? '',
      createdTime: json['created_time'] ?? '',
      description: json['description'] ?? '',
      keyId: json['key_id'] ?? '',
      pinned: json['pinned'] ?? false,
      title: json['title'] ?? '',
      allcategorie: json['all_categorie'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categorie_color': categorieColor,
      'categorie_id': categorieId,
      'categorie_name': categorieName,
      'created_time': createdTime,
      'description': description,
      'key_id': keyId,
      'pinned': pinned,
      'title': title,
      'all_categorie': allcategorie,
    };
  }
}
