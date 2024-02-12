import 'package:flutter/material.dart';
import 'package:stocks_app/src/features/authentication/models/article_model2.dart';


Widget customListTile(Article article){
  return Container(
    margin: const EdgeInsets.all(12.0),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18.0), boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(article.urlToImage),
            ),
            borderRadius: BorderRadius.circular(8.0),

          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(article.author),
        ),
        const SizedBox(height: 8.0),
        Text(article.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),),
      ],
    ),
  );
}