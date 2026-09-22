class Recipe {
  final String name;
  final String cuisine;
  final String image;

  Recipe({required this.name, required this.cuisine, required this.image});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      cuisine: json['cuisine'],
      image: json['image'],
    );
  }
}
