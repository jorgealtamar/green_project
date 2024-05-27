import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUser() async {
  List users = [];
  CollectionReference collectionUsers = db.collection('users');
  QuerySnapshot queryUsers = await collectionUsers.get();
  for (var element in queryUsers.docs) { 
    users.add(element.data());
  }
  return users;
}

Future<Map<String, dynamic>> getResiduo(String? id) async {
  Map<String, dynamic> residuos = {};

  final QuerySnapshot query =
      await db.collection('residuo').where('id', isEqualTo: id).get();

  if (query.docs.isNotEmpty) {
    // Accediendo al primer documento, ya que el ID es único y debería haber solo uno
    final DocumentSnapshot doc = query.docs.first;
    residuos = doc.data() as Map<String, dynamic>;
  }

  return residuos;
}

Future<List<Map<String, dynamic>>> getTemas() async {
  List<Map<String, dynamic>> temasList = [];

  final QuerySnapshot query = await db.collection('temas').get();

  if (query.docs.isNotEmpty) {
    temasList = query.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id; // Agregar el ID al mapa de datos
      return data;
    }).toList();
  }

  return temasList;
}

Future<Map<String, dynamic>> getTemaWithId(String? id) async {
  Map<String, dynamic> tema = {};

  final DocumentSnapshot doc = await db.collection('temas').doc(id).get();

  if (doc.exists) {
    tema = doc.data() as Map<String, dynamic>;
  }

  return tema;
}






Future<List<String>> getNameAndGender(String? uid) async {
  final docRef = db.collection("users").doc(uid);
  try {
    final doc = await docRef.get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      final firstName = data['first_name'] as String;
      final gender = data['gender'] as String; // Asegúrate de que el campo 'gender' exista.
      return [firstName, gender];
    } else {
      // El documento no existe, puedes manejar esto según tus necesidades.
      return ['desconocido', 'desconocido'];
    }
  } catch (e) {
    return ["Error obteniendo información del usuario", "desconocido"];
  }

  
}
