import 'dart:convert';

import 'package:http/http.dart' as http;
import 'attachment.dart';
import 'block.dart';

class SlackNotifier {
  SlackNotifier(this.token);

  /// Authentication token bearing required scopes.
  final String token;

  /// Sends a message to a channel.
  ///
  /// One of these arguments is required to describe the content of the message.
  /// If `attachments` or `blocks` are included, `text` will be used as fallback text for notifications only.
  Future<String> send(
    String text, {
    String? channel,
    String? iconEmoji,
    String? iconUrl,
    String? username,
    List<Block>? blocks,
    List<Attachment>? attachments,
  }) async {
    var webhookUrl = token.startsWith('https')
        ? token
        : 'https://hooks.slack.com/services/$token';

    var body = {'text': text, 'link_names': true};
    if (channel != null) body['channel'] = channel;
    if (iconEmoji != null) body['icon_emoji'] = iconEmoji;
    if (iconUrl != null) body['icon_url'] = iconUrl;
    if (username != null) body['username'] = username;
    if (blocks != null) {
      body['blocks'] = blocks.map((b) => b.toMap()).toList();
    }
    if (attachments != null) {
      body['attachments'] = attachments.map((a) => a.toMap()).toList();
    }

    var response = await http.post(
      Uri.parse(webhookUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: jsonEncode(body),
    );
    return response.body;
  }
}
