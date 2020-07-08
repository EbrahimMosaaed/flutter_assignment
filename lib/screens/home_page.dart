import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../screens/widgets/bottom_bar.dart';
import '../Model/upcoming_model.dart';
import '../constant/gradient.dart';
import '../bloc/upcoming_bloc.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _imageURL = 'https://image.tmdb.org/t/p/w500';

  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc();
    bloc.fetchAllUpcoming();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPress() {
      return showCupertinoModalPopup(
          context: context,
          builder: (context) => new CupertinoActionSheet(
                title: Text("Do you wish to close the app ?"),
                cancelButton: CupertinoActionSheetAction(
                  child: const Text("Close"),
                  isDefaultAction: true,
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ));
    }

    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
          backgroundColor: Color(0xFFF6F7FB),
          // resizeToAvoidBottomPadding: false,
          body: ListView(
            padding: EdgeInsets.zero,
            // physics: ScrollPhysics(),
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    _showYellowCircle(),
                    _showRedCircle(),
                    _showTitle(),
                    _showGridView(),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black87,
            // icon: Icon(Icons.arrow_downward),
            tooltip: ' Home ',
            label: Text("Home"),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomBarWidget()),
    );
  }

  _showYellowCircle() {
    return Positioned(
      top: -70,
      left: -30,
      bottom: 2,
      right: 150,
      child: Container(
        decoration:
            BoxDecoration(gradient: pinkgradient, shape: BoxShape.circle),
      ),
    );
  }

  _showRedCircle() {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        height: 90.0,
        width: 70.0,
        decoration:
            BoxDecoration(shape: BoxShape.circle, gradient: yellowgradient),
      ),
    );
  }

  _showTitle() {
    return Positioned(
      top: 100,
      left: 10,
      child: Column(
        children: <Widget>[
          Text(
            "Trending This Week",
            style: TextStyle(
                color: Colors.deepOrange[600],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Container(
            height: 2.5,
            width: 160,
            color: Colors.orange[200],
          ),
        ],
      ),
    );
  }

  _showGridView() {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: StreamBuilder(
          stream: bloc.allUpComing,
          builder: (context, snapshot) {
            MoviesModel movies = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("Pls Check Your Internet Connection "),
                );
              case ConnectionState.waiting:
                return Center(
                  child: SpinKitCubeGrid(
                      size: 40.0,
                      itemBuilder: (context, index) {
                        return DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: greyGradintForNotloading,
                                shape: BoxShape.circle));
                      }),
                );

              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error ${snapshot.error}"),
                  );
                } else {
                  movies = snapshot.data;
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    children: List.generate(movies.results.length, (int index) {
                      Movie movie = movies.results[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => DetailsPage(
                                movie: movies.results[index],
                                movieID: movie.id,
                              ),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 1000),
                            ),
                          );
                        },
                        child: GridTile(
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: _imageURL + movie.backdroPath,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CupertinoActivityIndicator(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          footer: GridTileBar(
                            backgroundColor: Colors.black54,
                            title: Text(
                              "${movies.results[index].titel}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
