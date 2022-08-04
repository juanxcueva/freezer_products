
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/domain/repository/user_repository.dart';
import 'package:freezer_products/app/domain/response/userResponse.dart';

class ProfileController extends SimpleNotifier {
  final _userRepository = Get.i.find<UserRepository>();

  bool _nombresValid = false;
  bool _apellidosValid = false;
  bool _sexo = false;
  bool _edad = false;

  ProfileController() {
    //initLogin();
    initProfile();
  }

  //variables
  UserResponse cliente = UserResponse(
      id: -1, firstName: "", lastName: "", sex: "", age: "0", state: '');

  String error = "";
  String clienteJson = "";

  String _nombre = "N";
  String _correo = "C";
  Image _imagen = Image.asset('assets/images/userProfile.jpeg');
  //String imagen = "https://cdn.britannica.com/41/218341-050-51D8903F/American-actor-John-Krasinski-2020.jpg";

  //Usuario cliente = Cliente();
  TextEditingController nombresTextController = TextEditingController();
  TextEditingController apellidosTextController = TextEditingController();
  TextEditingController sexTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();

  initProfile() async {
    print("initProfile");
    try {
      Map<String, dynamic> userResponse = await _userRepository.getUser();
      print(userResponse);
      if (userResponse["error"] != null) {
        error = userResponse["msg"];
        return false;
      } else {
        cliente = UserResponse.fromMap(userResponse["data"]);
        nombresTextController.text = cliente.firstName;
        apellidosTextController.text = cliente.lastName;
        sexTextController.text = cliente.sex;
        ageTextController.text = cliente.age;
        notify();
      }
    } catch (e) {
      print(e);
      error = "Existe un error al obtener el cliente";
    }
  }

  //Gets
  Image get imagen => _imagen;
  String get nombre => _nombre;
  String get correo => _correo;

  //set's

}
