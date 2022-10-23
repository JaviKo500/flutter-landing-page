// import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  int _currentIndex = 0;
  final List<String> _pages =  [
    'home',
    'about',
    'pricing',
    'contact',
    'location',
  ];

  createScrollController( String routerName ) {
    scrollController = PageController( initialPage: getPageIndex(routerName));
    html.document.title =_pages[ getPageIndex(routerName) ];
    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();
      if ( pageIndex != _currentIndex ) {
        html.window.history.pushState(null, '', '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
        html.document.title =_pages[ pageIndex ];
      }
    });
  }

  int getPageIndex( String routerName) => 
    (_pages.indexOf(routerName) == -1) 
      ? 0 
      : _pages.indexOf( routerName );

  goTo( int index) {
    scrollController.animateToPage( 
      index, 
      duration: const Duration( milliseconds: 300 ), 
      curve: Curves.easeInOut
    );
  }
}