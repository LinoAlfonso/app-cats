
import '../config.dart';

class ApiRoutes {

  static final String baseUrl                     = Environment.apiUrl;

  static final String getBreedsCats               = '${baseUrl}breeds';
  static final String searchCats                  = '${baseUrl}breeds/search';
}