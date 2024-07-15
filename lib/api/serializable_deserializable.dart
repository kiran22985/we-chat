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

//   // Convert User object to  map
//   Map<String, dynamic> userJson = user.toJson();

//   // Print  map
//   print(userJson);

//   // Convert  map to JSON string
//   String newJsonString = jsonEncode(userJson);

//   // Print JSON string
//   print(newJsonString);
// }



//=====================================================================//
// import 'dart:convert';

// class User {
//   String name;
//   int age;
//   String email;

//   User({
//     required this.name,
//     required this.age,
//     required this.email,
//   });

//   // Factory constructor for creating a new User instance from a map.
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'],
//       age: json['age'],
//       email: json['email'],
//     );
//   }

//   // Method for converting a User instance into a map.
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//       'email': email,
//     };
//   }
// }

// void main() {
//   // Example JSON string
//   String jsonString = '{"name": "John Doe", "age": 30, "email": "john.doe@example.com"}';

//   // Decoding the JSON string into a Map
//   Map<String, dynamic> userMap = jsonDecode(jsonString);

//   // Creating a User object from the JSON map
//   User user = User.fromJson(userMap);

//   print('Name: ${user.name}, Age: ${user.age}, Email: ${user.email}');
  
//   // Converting the User object back to JSON
//   String userToJson = jsonEncode(user.toJson());

//   print('User to JSON: $userToJson');
// }
