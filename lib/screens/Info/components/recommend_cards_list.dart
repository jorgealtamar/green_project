import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screens/Info/components/recommend_card.dart';
import 'package:myapp/services/firebase_service.dart';

class RecommendCardsList extends StatelessWidget {

  const RecommendCardsList({ super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getTemas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Mientras se carga la información
        } else if (snapshot.hasError) {
          return Text('Error al cargar los datos');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No hay datos disponibles');
        } else {
          final List<Map<String, dynamic>> temas = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...temas.map(
                  (tema) => RecommendGreenCard(
                    tittle: tema['titulo'],
                    press: () {
                      context.push('/tema/${tema['id']}');
                    },
                    urlImage: tema['imagen'],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          );
        }
      },
    );
  }
}
