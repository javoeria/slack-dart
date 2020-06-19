import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:slack_notifier/src/attachment.dart';

class SlackNotifier {
  SlackNotifier(this.token);

  /// Webhook URL that is specific to a single user and a single channel.
  final String token;

  /// Send message to your slack workspace.
  Future<String> send(
    String text, {
    String channel,
    String icon_emoji,
    String icon_url,
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
    if (icon_emoji != null) body['icon_emoji'] = icon_emoji;
    if (icon_url != null) body['icon_url'] = icon_url;
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
