# slack_notifier

A simple wrapper to post messages from external sources into Slack.

[![Build Status](https://travis-ci.com/javoeria/slack-dart.svg?branch=master)](https://travis-ci.com/javoeria/slack-dart)
[![pub package](https://img.shields.io/pub/v/slack_notifier.svg)](https://pub.dartlang.org/packages/slack_notifier)

## Usage

To use this package, your workspace needs to have a Webhook URL.
If you don't have it, follow the instructions [here](https://api.slack.com/messaging/webhooks).

The `SlackNotifier` class has only one method, with optional parameters to customize your messages.

```dart
Future<String> send(String text,
    {String channel, String icon_emoji, String icon_url, String username, List<Attachment> attachments});
```

## Result

The message will look like this:

![example](https://a.slack-edge.com/80588/img/integrations/incoming_webhook_example1.png)
