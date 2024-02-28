import 'package:flutter/material.dart';

class FavAppProvider extends ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  setIsSelected(bool value) {
    _isSelected = value;
    notifyListeners();
  }

  final List _selectedItems = [];
  List get selectedItems => _selectedItems;

  void addSelectedItems(int index) {
    _selectedItems.add(index);
    notifyListeners();
  }

  void removeSelectedItems(int index) {
    _selectedItems.remove(index);
    notifyListeners();
  }
}
