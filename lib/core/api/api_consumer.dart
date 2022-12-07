
abstract class ApiConsumer
{
  Future<dynamic> get (String url , {Map<String,dynamic> ? queryParams});
  Future<dynamic> post (String url , {Map<String,dynamic> ? body , Map<String,dynamic> ? queryParams});

}