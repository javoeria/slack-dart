import 'package:slack_notifier/slack_notifier.dart';

void main() {
  final slack = SlackNotifier('T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX');
  slack.send('Hello world :tada:', channel: 'general');
}
