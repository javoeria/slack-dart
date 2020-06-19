class Attachment {
  Attachment({
    this.author_icon,
    this.author_link,
    this.author_name,
    this.color,
    this.fallback,
    this.fields,
    this.footer,
    this.footer_icon,
    this.image_url,
    this.pretext,
    this.text,
    this.thumb_url,
    this.title,
    this.title_link,
    this.ts,
  });

  /// A valid URL that displays a small 16px by 16px image to the left of the author_name text.
  /// Will only work if author_name is present.
  final String author_icon;

  /// A valid URL that will hyperlink the author_name text.
  /// Will only work if author_name is present.
  final String author_link;

  /// Small text used to display the author's name.
  final String author_name;

  /// Changes the color of the border on the left side of this attachment from the default gray.
  /// Can either be one of good (green), warning (yellow), danger (red), or any hex color code (eg. #439FE0).
  final String color;

  /// A plain text summary of the attachment used in clients that don't show formatted text (eg. IRC, mobile notifications).
  final String fallback;

  /// An array of field objects that get displayed in a table-like way.
  /// For best results, include no more than 2-3 field objects.
  final List<Field> fields;

  /// Some brief text to help contextualize and identify an attachment.
  /// Limited to 300 characters, and may be truncated further when displayed to users in environments with limited screen real estate.
  final String footer;

  /// A valid URL to an image file that will be displayed beside the footer text.
  /// Will only work if author_name is present.
  /// We'll render what you provide at 16px by 16px.
  /// It's best to use an image that is similarly sized.
  final String footer_icon;

  /// A valid URL to an image file that will be displayed at the bottom of the attachment.
  /// We support GIF, JPEG, PNG, and BMP formats.
  ///
  /// Large images will be resized to a maximum width of 360px or a maximum height of 500px, while still maintaining the original aspect ratio.
  /// Cannot be used with thumb_url.
  final String image_url;

  /// Text that appears above the message attachment block.
  final String pretext;

  /// The main body text of the attachment.
  /// The content will automatically collapse if it contains 700+ characters or 5+ linebreaks, and will display a "Show more..." link to expand the content.
  final String text;

  /// A valid URL to an image file that will be displayed as a thumbnail on the right side of a message attachment.
  /// We currently support the following formats: GIF, JPEG, PNG, and BMP.
  ///
  /// The thumbnail's longest dimension will be scaled down to 75px while maintaining the aspect ratio of the image.
  /// The filesize of the image must also be less than 500 KB.
  ///
  /// For best results, please use images that are already 75px by 75px.
  final String thumb_url;

  /// Large title text near the top of the attachment.
  final String title;

  /// A valid URL that turns the title text into a hyperlink.
  final String title_link;

  /// An integer Unix timestamp that is used to related your attachment to a specific time.
  /// The attachment will display the additional timestamp value as part of the attachment's footer.
  ///
  /// Your message's timestamp will be displayed in varying ways, depending on how far in the past or future it is, relative to the present.
  /// Form factors, like mobile versus desktop may also transform its rendered appearance.
  final int ts;

  Map<dynamic, dynamic> toMap() {
    var attachment = {};
    if (author_icon != null) attachment['author_icon'] = author_icon;
    if (author_link != null) attachment['author_link'] = author_link;
    if (color != null) attachment['color'] = color;
    if (fallback != null) attachment['fallback'] = fallback;
    if (fields != null) {
      attachment['fields'] = fields.map((f) => f.toMap()).toList();
    }
    if (footer != null) attachment['footer'] = footer;
    if (footer_icon != null) attachment['footer_icon'] = footer_icon;
    if (image_url != null) attachment['image_url'] = image_url;
    if (pretext != null) attachment['pretext'] = pretext;
    if (text != null) attachment['text'] = text;
    if (thumb_url != null) attachment['thumb_url'] = thumb_url;
    if (title != null) attachment['title'] = title;
    if (title_link != null) attachment['title_link'] = title_link;
    if (ts != null) attachment['ts'] = ts;

    return attachment;
  }
}

class Field {
  Field({this.title, this.value, this.short});

  /// Shown as a bold heading displayed in the field object.
  final String title;

  /// The text value displayed in the field object.
  final String value;

  /// Indicates whether the field object is short enough to be displayed side-by-side with other field objects.
  /// Defaults to `false`.
  final bool short;

  Map<dynamic, dynamic> toMap() {
    var field = {};
    if (title != null) field['title'] = title;
    if (value != null) field['value'] = value;
    if (short != null) field['short'] = short;

    return field;
  }
}
