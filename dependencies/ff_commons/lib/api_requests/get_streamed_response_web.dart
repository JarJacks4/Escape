import 'package:fetch_client/fetch_client.dart';
import 'package:http/http.dart';

Future<StreamedResponse> getStreamedResponse(Request request) async {
  final FetchClient fetchClient = FetchClient(mode: RequestMode.cors);
  final FetchResponse response = await fetchClient.send(request);
  return response;
}

