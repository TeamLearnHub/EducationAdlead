import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class PageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _pageHome();
  }
}

class _pageHome extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200.0,
                        width: double.infinity,
                        child: Carousel(
                          boxFit: BoxFit.cover,
                          images: [
                            NetworkImage(
                                'https://static2.yan.vn/YanNews/2167221/201702/20170223-040230-1_600x205.jpg'),
                            NetworkImage(
                                'https://cdn.tgdd.vn/Files/2019/08/30/1193408/1200-628_800x450.png'),
                            NetworkImage(
                                'https://bachlongmobile.com/bnews/wp-content/uploads/2019/08/kid-952x500-min-1.png')
                          ],
                          dotSize: 4.0,
                          autoplay: true,
                          dotSpacing: 15.0,
                          indicatorBgPadding: 1.0,
                          borderRadius: false,
                          moveIndicatorFromBottom: 180.0,
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 10.0, left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          "Sản phẩm đang khuyến mại",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: FlatButton(
                                            onPressed: () =>
                                                print('Sản phẩm khuyến mại'),
                                            child: Text(
                                              "Xem thêm >",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 140.0,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          "Sản phẩm bán chạy",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: FlatButton(
                                            onPressed: () =>
                                                print('Sản phẩm khuyến mại'),
                                            child: Text(
                                              "Xem thêm >",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'http://dong-ho-dep.com/wp-content/uploads/2015/04/xem-cac-kieu-hinh-anh-dong-ho-deo-tay-nu.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'http://dong-ho-dep.com/wp-content/uploads/2015/04/xem-cac-kieu-hinh-anh-dong-ho-deo-tay-nu.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'http://dong-ho-dep.com/wp-content/uploads/2015/04/xem-cac-kieu-hinh-anh-dong-ho-deo-tay-nu.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'http://dong-ho-dep.com/wp-content/uploads/2015/04/xem-cac-kieu-hinh-anh-dong-ho-deo-tay-nu.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          height: 100,
                                          width: 120,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://i.pinimg.com/236x/40/b0/43/40b043be191ef7d99f5cbe55c099b1f2--taps-album.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))
                  ]),
            ))
      ],
    ));
  }
}
