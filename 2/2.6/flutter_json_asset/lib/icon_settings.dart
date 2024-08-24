final class IconSettings {
  final int size;
  final int colorIndex;
  final int iconIndex;

  IconSettings(this.size, this.colorIndex, this.iconIndex);

  factory IconSettings.fromJson(Map<String, dynamic> json) {
    return IconSettings(
      json["size"],
      json["color_index"],
      json["icon_index"],
    );
  }
}
