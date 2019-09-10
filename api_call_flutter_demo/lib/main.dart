import 'dart:async';

import 'package:api_call_flutter_demo/api_call.dart';
import 'package:api_call_flutter_demo/api_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MyApp(apiResponseFuture: getTodayWallpaper()));

class MyApp extends StatelessWidget {
  final Future<ApiResponse> apiResponseFuture;
  BuildContext context;

  MyApp({Key key, this.apiResponseFuture}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData(primaryColor: Colors.cyan, accentColor: Colors.cyanAccent),
      home: Center(
        child: FutureBuilder<ApiResponse>(
          future: apiResponseFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return parseUrl(snapshot);
            } else if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
                textScaleFactor: 0.5,
              );
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget parseUrl(AsyncSnapshot<ApiResponse> snapshot) {
    return Center(
      child: CachedNetworkImage(
        placeholder: (context, url) => CircularProgressIndicator(),
        imageUrl: snapshot.data.url,
      ),
    );
  }
}
