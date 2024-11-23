
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../domain/domain.dart';

class CatsProvider extends ChangeNotifier {

  final CatsRepository _catsRepository;

  CatsProvider({required CatsRepository catsRepository})
      : _catsRepository = catsRepository {
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener((pageKey) {
      _currentPage = pageKey;
      getBreedsCats();
    });
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 0;

  set updateLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  late PagingController<int, Cat> pagingController;
  final List<Cat> _allCats = [];

  bool _isSearching = false;

  Future<void> getBreedsCats() async {
    try {
      if (_isSearching) return;
      final catsResponse = await _catsRepository.getBreedsCats(page: _currentPage);
       if(catsResponse.isNotEmpty){
          _allCats.addAll(catsResponse);
        }
        final isLastPage = catsResponse.length < 20;
        if (isLastPage) {
          pagingController.appendLastPage(catsResponse);
        } else {
          final nextPageKey = _currentPage + 1;
          pagingController.appendPage(catsResponse, nextPageKey);
        }
    } catch (e) {
      pagingController.error = e;
      throw Exception(e);
    }finally{
      //updateLoading = false;
    }
  }

  Future<void> _getSearchCatsAPI(String queryName) async {
    try {
      final searchResults = await _catsRepository.getSearchCats(queryName: queryName);
      if (searchResults.isNotEmpty) {
        pagingController.refresh();
        pagingController.appendLastPage(searchResults);
      } else {
        pagingController.refresh();
        pagingController.appendLastPage([]);
      }
    } catch (e) {
      pagingController.error = e;
      throw Exception(e);
    }finally{

    }
  }

  void searchBreedCat(String nameBreed){
    _isSearching = nameBreed.isNotEmpty;
    if (_isSearching) {
      pagingController.itemList = [];
      final searchResults = _allCats
          .where((cat) => cat.name!.toLowerCase().contains(nameBreed.toLowerCase()))
          .toList();
      if (searchResults.isNotEmpty) {
        pagingController.appendLastPage(searchResults);
      } else {
        //Si no esta el resultado localmente se hace la peticion al API
        _getSearchCatsAPI(nameBreed);
      }
    } else {
      clearSearch();
    }
  }



  void clearSearch() {
    _isSearching = false;
    _allCats.clear();
    pagingController.refresh();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

}