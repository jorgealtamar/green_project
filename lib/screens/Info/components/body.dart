import 'package:flutter/material.dart';
import 'package:myapp/screens/Info/components/header_with_search_box.dart';
import 'package:myapp/screens/Info/components/news_cards_list.dart';
import 'package:myapp/screens/Info/components/recommend_cards_list.dart';
import 'package:myapp/screens/Info/components/tittle_with_more_btn.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWithSearchBox(),
          TittleWithBtn(
            tittle: 'Recomendado',
            press: (){},
          ), // boton mas
          const RecommendCardsList(),
          TittleWithBtn(tittle: 'Noticias', press: (){}),
          const NewsCardsList(),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}

