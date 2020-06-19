import 'package:slack_notifier/slack_notifier.dart';
import 'package:test/test.dart';

void main() {
  SlackNotifier slack;

  setUpAll(() {
    // This Webhook URL is for testing only
    slack = SlackNotifier('T014XKJ2C31/B014XKLF2S3/jtDgfbsVzEUusc2i2mUk3o2b');
  });

  test('send plain message', () async {
    var response = await slack.send('test', channel: 'test');
    expect(response, 'ok');
  });

  test('send attachment message', () async {
    var attachment = Attachment(title: 'title');
    var response =
        await slack.send('test', channel: 'test', attachments: [attachment]);
    expect(response, 'ok');
  });

  test('send null message', () async {
    var response = await slack.send(null, channel: 'test');
    expect(response, 'missing_text_or_fallback_or_attachments');
  });

  test('channel not found', () async {
    var response = await slack.send('test', channel: 'asdf');
    expect(response, 'channel_not_found');
  });

  test('team not found', () async {
    var response = await SlackNotifier('T/B/X').send('test');
    expect(response, 'no_team');
  });
}
