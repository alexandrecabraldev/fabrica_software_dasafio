class CatModel{
  int? id;
  String name;
  int age;
  String color;
  String breed;
  double weight;

  CatModel({
    this.id,
    required this.name,
    required this.age,
    required this.color,
    required this.breed,
    required this.weight,
  });

  factory CatModel.fromMap(Map<String, dynamic> map){
  return CatModel(
    id: map['id'],
    name: map['name'],
    age: map['age'],
    color: map['color'],
    breed: map['breed'],
    weight: map['weight'],
  );
}

Map<String, dynamic> toMap(){
  return {
    'id': id,
    'name': name,
    'age': age,
    'color': color,
    'breed': breed,
    'weight': weight,
  };
}
}

