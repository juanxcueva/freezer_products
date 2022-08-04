
import 'dart:convert';

class UserResponse {
    UserResponse({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.sex,
        required this.age,
        required this.state,
    });

    int id;
    String firstName;
    String lastName;
    String sex;
    String age;
    String state;

    factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        sex: json["sex"],
        age: json["age"],
        state: json["state"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "sex": sex,
        "age": age,
        "state": state,
    };
}
