import 'package:flutter/material.dart';
import 'package:myapp/screens/Info/components/card_news.dart';

class NewsCardsList extends StatelessWidget {
  const NewsCardsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          CardNews(
            urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3JGHwLyhlIwDtm6BRDjOpPN_1_DouuL1vg&usqp=CAU',
            headerNews: 'Unisimón recibió por parte de ICONTEC certificación de basura cero.',
            press: (){},
          ),
          CardNews(
            urlImage: 'https://vivelanoticia.com/wp-content/uploads/2020/10/recicla.jpg',
            headerNews: 'Recicla por BAQ una iniciativa ambiental de la alcaldia de Barranquilla.',
            press: (){},
          ),
      ],
    );
  }
}

