import 'package:slack_notifier/slack_notifier.dart';
import 'package:test/test.dart';

void main() {
  late SlackNotifier slack;

  setUpAll(() {
    // This Webhook URL is for testing only
    slack = SlackNotifier('T014XKJ2C31/B014XKLF2S3/jtDgfbsVzEUusc2i2mUk3o2b');
  });

  test('send plain message', () async {
    var response = await slack.send(
      'Hello world',
      channel: 'test',
      iconEmoji: ':chart_with_upwards_trend:',
      iconUrl: 'https://picsum.photos/48/48',
      username: 'My Bot',
    );
    expect(response, 'ok');
  });

  test('send block message', () async {
    var block = SectionBlock(text: 'Hello world');
    var response = await slack.send('', channel: 'test', blocks: [block]);
    expect(response, 'ok');
  });

  test('send attachment message', () async {
    var attachment = Attachment(pretext: 'pre-hello', text: 'text-world');
    var response =
        await slack.send('', channel: 'test', attachments: [attachment]);
    expect(response, 'ok');
  });

  test('send null message', () async {
    var response = await slack.send('', channel: 'test');
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

  test('send multiple blocks', () async {
    var blocks = [
      HeaderBlock(text: 'Onboarding'),
      SectionBlock(text: 'Example message for engaging new users.'),
      DividerBlock(),
      SectionBlock(
          text:
              "Hey there :wave: I'm *TaskBot*. I'm here to help you create and manage tasks in Slack."),
      ImageBlock(
        imageUrl:
            'https://api.slack.com/img/blocks/bkb_template_images/onboardingComplex.jpg',
        altText: 'image1',
        title: 'image1',
      ),
    ];
    var response = await slack.send('test', channel: 'test', blocks: blocks);
    expect(response, 'ok');
  });
}
