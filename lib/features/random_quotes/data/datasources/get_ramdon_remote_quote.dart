
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/end_points.dart';
import '../models/guote_model.dart';

abstract class GetRandomRemoteQuote
{
  Future<QuoteModel> getRandomRemoteQuote () ;
}

class GetRandomRemoteQuoteImpl extends GetRandomRemoteQuote
{
  ApiConsumer client ;

  GetRandomRemoteQuoteImpl({required this.client});

  
  @override
  Future<QuoteModel> getRandomRemoteQuote() async
  {
    final response = await client.get(ApiEndPoints.randomQuoteUrl );

    return QuoteModel.fromJson(response) ;
  }

}