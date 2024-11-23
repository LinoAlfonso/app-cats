
import 'package:flutter/material.dart';
import '../../domain/domain.dart';

class CatsProvider extends ChangeNotifier {

  final CatsRepository _catsRepository;
  CatsProvider({required CatsRepository catsRepository}) : _catsRepository = catsRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 0;
  bool _hasMorePages = true;

  set updateLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final List<Cat> _cats = [];
  List<Cat> _catsSearch = [];
  List<Cat> get cats => _catsSearch.isEmpty?_cats:_catsSearch;

  bool _isSearch = false;

  Future<void> getBreedsCats() async {
    try {
      updateLoading = true;
       final catsResponse = await _catsRepository.getBreedsCats(page: _currentPage);
       if(catsResponse.isEmpty){
         _hasMorePages = false;
        }else{
          _cats.addAll(catsResponse);
          _currentPage++;
        }
    } catch (e) {
      throw Exception(e);
    }finally{
      updateLoading = false;
    }
  }

  Future loadMoreCats() async {
    if (!isLoading && _hasMorePages) {
      await getBreedsCats();
    }
  }

  void searchBreedCat(String nameBreed){
    _isSearch = true;
   final result = _cats.where((cat) => cat.name!.toLowerCase().contains(nameBreed.toLowerCase())).toList();
    _catsSearch = result;
   notifyListeners();
  }

}