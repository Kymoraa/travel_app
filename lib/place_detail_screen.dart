import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/animated_detail_header.dart';
import 'package:travel_app/place.dart';
import 'package:travel_app/theme/text_theme_x.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
    required this.screenHeight,
  }) : super(key: key);

  final TravelPlace place;
  final double screenHeight;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late ScrollController _controller;
  late ValueNotifier<double> bottomPercentNotifier;
  bool _isAnimatingScroll = false;

  void _scrollListener(){
    var percent = _controller.position.pixels / MediaQuery.of(context).size.height;
    bottomPercentNotifier.value = (percent / .3).clamp(0.0, 1.0);
  }

  void _isScrollingListener(){
    var percent = _controller.position.pixels / widget.screenHeight;
    if(!_controller.position.isScrollingNotifier.value){
      if(percent < .3 && percent > .1){
        setState(() => _isAnimatingScroll = true);
        _controller.animateTo(
          widget.screenHeight * .3,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        ).then((value) => setState(() => _isAnimatingScroll = false));
      }
      if(percent < .1 && percent > .0){
        setState(() => _isAnimatingScroll = true);
        _controller.animateTo(
          0,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        ).then((value) => setState(() => _isAnimatingScroll = false));
      }
      if(percent < .5 && percent > .3){
        setState(() => _isAnimatingScroll = true);
        _controller.animateTo(
          widget.screenHeight * .3,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        ).then((value) => setState(() => _isAnimatingScroll = false));
      }
    }
  }

  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: widget.screenHeight * .3);
    _controller.addListener(_scrollListener);
    WidgetsBinding.instance! .addPostFrameCallback((_) {
      _controller.position.isScrollingNotifier.addListener(_isScrollingListener);
    });
    bottomPercentNotifier = ValueNotifier(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AbsorbPointer(
            absorbing: _isAnimatingScroll,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: BuilderPersistentDelegate(
                    maxExtent: MediaQuery.of(context).size.height,
                    minExtent: 240,
                    builder: (percent) {
                      final bottomPercent = (percent/.3).clamp(0.0, 1.0);
                      return AnimatedDetailHeader(
                        topPercent: ((1 - percent)/.7).clamp(0.0, 1.0),
                        bottomPercent: bottomPercent,
                        place: widget.place,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: TranslateAnimation(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.black26),
                              Flexible(
                                child: Text(
                                  widget.place.locationDesc,
                                  style: context.bodyText1.copyWith(color: Colors.blue),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(widget.place.description),
                          const SizedBox(height: 10),
                          Text(widget.place.description),
                          const SizedBox(height: 20),
                          const Text('PLACES IN THIS COLLECTION',
                            style: TextStyle(fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: TravelPlace.places.length, // TravelPlace.collectionPlaces.length,
                      itemBuilder: (context, index){
                        final collectionPlace = TravelPlace.places[index]; // final collectionPlace = TravelPlace.collectionPlaces[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              collectionPlace.imageUrl.first,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: bottomPercentNotifier,
            builder: (context, value, child){
              return Positioned.fill(
                top: null,
                bottom: -130 * (1 - value),
                child: child!
              );
            },
            child: Container(
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white70,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade800,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        for(var i = 0; i <= 3; i++)
                          Align(
                            widthFactor: .7,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    TravelUser.users[i].urlPhoto,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(width: 10),
                        const Text('Comments',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('120',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate({
    required this.builder,
    required double maxExtent,
    required double minExtent,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
