import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yt_framework/core/models/now_showing_model.dart';
import 'package:yt_framework/core/services/api.dart';
import 'package:yt_framework/core/utils/adaptive.dart';
import 'package:yt_framework/core/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieController movieController;
  Future<NowShowingModel> nowShowingFuture;

  List<String> genres = [
    'Tv Shows',
    'Movies',
    'Trending',
    'People',
    'Networks',
    'Tv Episodes',
  ];

  List<String> bgGenres = [
    'https://wallpaperaccess.com/full/900473.jpg',
    'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg',
    'https://s3-us-west-2.amazonaws.com/flx-editorial-wordpress/wp-content/uploads/2019/09/01093013/Endgame-Lead-1.jpg',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-movies-1606255499.jpg',
    'https://timesofindia.indiatimes.com/photo.cms?msid=79062228&resizemode=4',
    'https://i.ytimg.com/vi/XDrwmLdXzXE/movieposter_en.jpg',
  ];

  void _setup() {
    movieController = Get.put(MovieController());

    nowShowingFuture = () {
      return movieController.fetchNowShowingMovies();
    }();
  }

  @override
  void initState() {
    _setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 450,
                child: FutureBuilder(
                    future: nowShowingFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: AdaptiveActivityIndicator(),
                        );
                      }

                      final NowShowingModel nowShowing = snapshot.data;

                      return CarouselSlider(
                        options: CarouselOptions(
                          height: context.height,
                          scrollDirection: Axis.horizontal,
                          viewportFraction: 1,
                        ),
                        items: nowShowing.results.map((movie) {
                          return getMovieItem(movie);
                        }).toList(),
                      );
                    }),
              ),
              SizedBox(height: 16),
              Container(
                height: 100,
                color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, i) {
                    return getGenreItem(
                      genres[i],
                      bgGenres[i],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Popular',
                  style: tStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 260,
                child: FutureBuilder(
                  future: nowShowingFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: AdaptiveActivityIndicator(),
                      );
                    }

                    final NowShowingModel nowShowing = snapshot.data;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: nowShowing.results.length,
                      itemBuilder: (context, i) {
                        final Result movie = nowShowing.results[i];
                        return getPopularItem(movie);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'You have the latest movies available! Enjoy 🎉',
                    style: tStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGenreItem(
    String title,
    String imgUrl,
  ) {
    return Container(
      width: 180,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.red.withOpacity(0.65),
                BlendMode.srcOver,
              ),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              '$title',
              style: tStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getMovieItem(Result movie) {
    final String parsedDate = DateFormat.yMMMd().format(movie.releaseDate);

    return Container(
      height: context.height,
      width: context.width,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            bottom: 22,
            child: Image.network(
              '${Strings.imageUrl}${movie.posterPath}',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 22,
            right: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${movie.title}',
                      style: tStyle.copyWith(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${movie.voteAverage}/10   ●   $parsedDate',
                      style: tStyle.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              'Play',
                              style: tStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Text(
                              'My List',
                              style: tStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPopularItem(Result movie) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 160,
          child: Stack(
            children: [
              Container(
                height: context.width,
                width: context.width,
                child: Image.network(
                  '${Strings.imageUrl}${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '${movie.adult ? 'R18' : ''}',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get tStyle => Theme.of(context).textTheme.bodyText1.copyWith(
        color: Colors.white,
      );
}

class MovieController extends GetxController {
  // Fetch now showing
  Future<NowShowingModel> fetchNowShowingMovies() async {
    try {
      final res = await Api.get('now_playing');

      return compute(nowShowingModelFromJson, res.body);
    } catch (e) {
      return showAlertDialog(
        'Error',
        'Something went wrong',
        Get.context,
      );
    }
  }
}
