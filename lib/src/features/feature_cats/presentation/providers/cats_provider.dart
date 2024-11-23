
import 'package:flutter/material.dart';
import '../../domain/domain.dart';

class CatsProvider extends ChangeNotifier {

  final CatsRepository _catsRepository;
  CatsProvider({required CatsRepository catsRepository}) : _catsRepository = catsRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 0;

  set updateLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Cat> _cats = [];
  List<Cat> get cats => _cats;

  Future<void> getBreedsCats() async {
    try {
      updateLoading = true;
      _cats = await _catsRepository.getBreedsCats(page: _currentPage);
      _currentPage++;
    } catch (e) {
      throw Exception(e);
    }finally{
      updateLoading = false;
    }
  }

}