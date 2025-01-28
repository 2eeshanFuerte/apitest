import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/reel_model.dart';
import '../repositories/reel_repository.dart';

class ReelRepositoryImpl implements ReelRepository {
  final http.Client httpClient;

  ReelRepositoryImpl(this.httpClient);

  final String baseUrl =
      'https://api.ulearna.com/bytes/all?page=1&limit=10&country=United+States';

  @override
  Future<List<ReelModel>> fetchReels({required int page, required int limit}) async {
    try {
      final response = await httpClient.get(
        Uri.parse('$baseUrl&page=$page&limit=$limit'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<ReelModel> reels = (data['data'] as List)
            .map((reel) => ReelModel.fromJson(reel))
            .toList();
        return reels;
      } else {
        throw Exception('Failed to load reels');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
