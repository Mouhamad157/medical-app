class LoginModels {
  final String name;
  final int id;

  LoginModels({
    required this.name,
    required this.id,
  });
  factory LoginModels.fromJson({required Map<String,dynamic>json}){
    return LoginModels(name: json['name'], id: json['id']);
  }
}
