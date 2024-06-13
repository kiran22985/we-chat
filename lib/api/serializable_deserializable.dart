// import 'dart:convert';

// class User {
//   final int id;
//   final String name;
//   final String email;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//   });

//   // Factory constructor to create a User instance from JSON
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }

//   // Method to convert a User instance to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//     };
//   }
// }

// void main() {
//   // Example JSON string
//   String jsonString = '{"id": 1, "name": "John Doe", "email": "johndoe@example.com"}';

//   // Decode JSON string to map
//   Map<String, dynamic> userMap = jsonDecode(jsonString);

//   // Create a User object from JSON map
//   User user = User.fromJson(userMap);

//   // Print User object
//   print('ID: ${user.id}');
//   print('Name: ${user.name}');
//   print('Email: ${user.email}');

//   // Convert User object to JSON map
//   Map<String, dynamic> userJson = user.toJson();

//   // Print JSON map
//   print(userJson);

//   // Convert JSON map to JSON string
//   String newJsonString = jsonEncode(userJson);

//   // Print JSON string
//   print(newJsonString);
// }