

import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier
{
    bool isSearched = false;
    void isClickedSearch ()
    {
      isSearched = ! isSearched;
       
      notifyListeners();
    }


   String _searchQuery = '';

  String get searchQuery => _searchQuery;
  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

 bool isDark = false ;
     void isDarkMode ()
    {
      isDark = ! isDark;
       
      notifyListeners();
    }

}

   

