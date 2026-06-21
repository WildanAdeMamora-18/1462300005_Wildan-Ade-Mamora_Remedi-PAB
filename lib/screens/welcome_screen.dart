import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../services/api_services.dart';
import 'detail_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() =>
      _WelcomeScreenState();
}

class _WelcomeScreenState
    extends State<WelcomeScreen> {

  late Future<List<ArticleModel>>
      futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles =
        ApiService().getArticles();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("SpaceNews Core"),
      ),

      body: FutureBuilder<
          List<ArticleModel>>(
        future: futureArticles,

        builder:
            (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final articles =
              snapshot.data!;

          return ListView(
            children: [

              Container(
                height: 220,
                margin:
                    const EdgeInsets.all(
                        10),

                decoration:
                    BoxDecoration(
                  borderRadius:
                      BorderRadius
                          .circular(15),

                  image:
                      DecorationImage(
                    image:
                        NetworkImage(
                      articles[0]
                          .imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const Padding(
                padding:
                    EdgeInsets.all(12),
                child: Text(
                  "Latest News",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              ...articles.map(
                (article) {

                  return Card(
                    margin:
                        const EdgeInsets
                            .all(8),

                    child: ListTile(

                      leading:
                          Image.network(
                        article.imageUrl,
                        width: 80,
                        fit:
                            BoxFit.cover,
                      ),

                      title: Text(
                        article.title,
                        maxLines: 2,
                        overflow:
                            TextOverflow
                                .ellipsis,
                      ),

                      subtitle:
                          Text(
                        article.newsSite,
                      ),

                      onTap: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                                DetailScreen(
                              article:
                                  article,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}