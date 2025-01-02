import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../service/user_service.dart';

class Controller extends ChangeNotifier {
  UserService service = UserService();
  PageController pageController = PageController(initialPage: 0);
  bool isLoading = true;
  bool isLoadingMore = false;
  List<Character> characters = [];
  List<Character> favCharacters = [];
  final ScrollController _allCharactersScrollController = ScrollController();
  final ScrollController _favCharactersScrollController = ScrollController();
  int currentPage = 1;

  Controller() {
    fetchUsers();
    _allCharactersScrollController.addListener(() {
      if (_allCharactersScrollController.position.pixels == _allCharactersScrollController.position.maxScrollExtent
          && !isLoadingMore) {
        _loadMore();
      }
    });
  }

  bool isFavorite(Character character) {
    return favCharacters.contains(character);
  }

  void toggleFavorite(Character character) {
    if (isFavorite(character)) {
      favCharacters.remove(character);
    } else {
      favCharacters.add(character);
    }
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    try {
      final value = await service.getUser(currentPage);
      characters.addAll(value);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadMore() async {
    isLoadingMore = true;
    currentPage++;
    await fetchUsers();
    isLoadingMore = false;
    notifyListeners();
  }

  allCharactersButton(){
    pageController.jumpToPage(0);
  }
  favCharactersButton(){
    pageController.jumpToPage(1);
  }

  ScrollController get allCharactersScrollController => _allCharactersScrollController;
  ScrollController get favCharactersScrollController => _favCharactersScrollController;

}
