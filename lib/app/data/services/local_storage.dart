import 'package:alfred_taxi_driver/app/data/models/driver_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage extends GetxController {
  final box = GetStorage();
  var isAuth = false.obs;
  static const String tableName = "driver_user_data";

  ///`READ USER DATA FROM LOCAL STORAGE AND RETURN`
  ///`USER IF NOT EMPTY ELSE EMPTY USER`
  Future<Driver> readUserData() async {
    var currentUser = Driver();
    if (box.read(tableName) != null) {
      final data = box.read(tableName) as Map<String, dynamic>;

      currentUser = Driver(
        id: data['id'] ?? 0,
        nom: data['nom'] ?? '',
        prenom: data['prenom'] ?? '',
        telephone: data['telephone'] ?? '',
        password: data['password'] ?? '',
        gpsLatitude: data['gps_latitude'],
        gpsLongitude: data['gps_longitude'],
        proprioId: data['proprio_id'] ?? 0,
        vehiculeId: data['vehicule_id'] ?? 0,
        immatriculation: data['immatriculation'] ?? '',
        language: data['language'] ?? '',
        theme: data['theme'] ?? '',
      );
    } else {
      currentUser = Driver(id: null);
    }
    print("CURRENT USER: ${currentUser.toJson()}");
    return currentUser;
  }

  ///`SAVE USER DATA INTO LOCAL STORAGE`
  Future saveUserData(Driver model) async {
    box.write(
      tableName,
      {
        "id": model.id ?? 0,
        "nom": model.nom ?? '',
        "prenom": model.prenom ?? '',
        "telephone": model.telephone ?? '',
        "password": model.password ?? '',
        "gps_latitude": model.gpsLatitude,
        "gps_longitude": model.gpsLongitude,
        "proprio_id": model.proprioId ?? 0,
        "vehicule_id": model.vehiculeId ?? 0,
        "immatriculation": model.immatriculation ?? '',
        "language": model.language ?? '',
        "theme": model.theme ?? '',
      },
    );
    await readUserData();
  }

  @override
  void onInit() {
    readUserData();
    super.onInit();
  }
}
