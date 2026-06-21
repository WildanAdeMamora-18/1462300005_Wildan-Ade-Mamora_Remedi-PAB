import 'package:flutter/material.dart';

import '../models/article_model.dart';

class DetailScreen
    extends StatelessWidget {

  final ArticleModel article;

  const DetailScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Detail News",
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Image.network(
              article.imageUrl,
            ),

            Padding(
              padding:
                  const EdgeInsets.all(
                      16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [

                  Text(
                    article.title,
                    style:
                        const TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    article.newsSite,
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    article.summary,
                    textAlign:
                        TextAlign
                            .justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}