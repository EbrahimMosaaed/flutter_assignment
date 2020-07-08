import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Model/upcoming_model.dart';
import '../bloc/upcoming_bloc.dart';

class DetailsPage extends StatefulWidget {
  final Movie movie;
  final int movieID;
  DetailsPage({Key key, this.movie, this.movieID}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  final _imageURL = 'https://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    super.initState();
    bloc.fetchMovieGener(widget.movie.id);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.movie.posterPath != null
                  ? _imageURL + widget.movie.posterPath
                  : 'https://image.freepik.com/free-vector/404-error-concept-with-camel-and-cactus_23-2147736339.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "${widget.movie.titel}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 24),
                      ),
                    ),
                    Divider(
                      height: 4,
                      thickness: 3,
                      // endIndent: ,
                      color: Colors.yellow,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${widget.movie.overView}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey,
        label: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          FontAwesomeIcons.arrowAltCircleLeft,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
