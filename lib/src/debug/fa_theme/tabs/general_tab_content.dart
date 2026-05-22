import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

class GeneralTabContent extends StatelessWidget {
  const GeneralTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FaThemeHub.instance.getCurrentTheme();
    final tokens = theme.tokens;

    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        _buildInfoItem("Theme Name", theme.name, Icons.label_outline),
        _buildInfoItem(
          "Brightness",
          theme.brightness.name.toUpperCase(),
          Icons.brightness_medium,
        ),
        _buildInfoItem(
          "Seed Color",
          "#${theme.seedColor.toARGB32().toRadixString(16).toUpperCase()}",
          Icons.colorize,
          color: theme.seedColor,
        ),
        _buildInfoItem(
          "Font Family",
          theme.fontFamily ?? "System Default",
          Icons.font_download,
        ),
        const Divider(),
        _buildInfoItem(
          "Icon Symbol",
          theme.icon.codePoint.toString(),
          theme.icon,
        ),
        _buildInfoItem(
          "Sidebar Width",
          "${tokens.layout.sidebarWidth} px",
          Icons.view_sidebar,
        ),
        _buildInfoItem(
          "Default Radius",
          "${tokens.radius.md} px",
          Icons.rounded_corner,
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    String title,
    String value,
    IconData icon, {
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Text(value),
      trailing: color != null
          ? Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            )
          : null,
    );
  }
}
