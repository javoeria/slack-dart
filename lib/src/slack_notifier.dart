import 'dart:convert';

import 'package:http/http.dart' as http;
import 'attachment.dart';

class SlackNotifier {
  SlackNotifier(this.token);

  /// Webhook URL that is specific to a single user and a single channel.
  final String token;

  /// Send message to your slack workspace.
  Future<String> send(
    String text, {
    String channel,
    String iconEmoji,
    String iconUrl,
    String username,
    List<Attachment> attachments,
  }) async {
    var webhookUrl = token.startsWith('https')
        ? token
        : 'https://hooks.slack.com/services/$token';

    var body = {
      'text': text,
      'link_names': true,
    };
    if (channel != null) body['channel'] = channel;
    if (iconEmoji != null) body['icon_emoji'] = iconEmoji;
    if (iconUrl != null) body['icon_url'] = iconUrl;
    if (username != null) body['username'] = username;
    if (attachments != null) {
      body['attachments'] = attachments.map((a) => a.toMap()).toList();
    }

    var response = await http.post(
      webhookUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return response.body;
  }
}
