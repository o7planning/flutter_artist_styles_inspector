import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

class FaThemeSelectionDialog extends StatelessWidget {
  const FaThemeSelectionDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FaThemeSelectionDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FaDialog(
      titleText: "Select Experience",
      iconData: Icons.palette_outlined,
      contentPadding: EdgeInsets.zero,
      preferredContentWidth: 420,
      preferredContentHeight: 280,
      content: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return FaThemeNameListenableBuilder(
      builder: (BuildContext context, themeName, Widget? child) {
        final names = FaThemeHub.instance.availableThemeNames;
        final currentThemeName = FaThemeHub.instance.lastNotifyThemeName;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 4),
          itemCount: names.length,
          itemBuilder: (context, index) {
            final name = names[index];
            final themeDef = FaThemeHub.instance.getThemeDefinition(name);
            final isSelected = currentThemeName == name;

            // ✅ FIXED: Thay Container bằng Material thực thụ để làm bạt nền vẽ Inkwell, triệt tiêu DecoratedBox lỗi
            return Material(
              color: isSelected
                  ? context.faColors.surface.row.selected
                  : context.faColors.surface.row,
              child: InkWell(
                onTap: () {
                  FaThemeHub.instance.setThemeByName(name);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border(
                            left: BorderSide(
                              color: context.faColors.stroke.strong,
                              width: 3.5,
                            ),
                          )
                        : const Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: 3.5,
                            ),
                          ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? context
                                    .faColors
                                    .action
                                    .fill
                                    .primaryTonal
                                    .selected
                              : context.faColors.action.fill.primaryTonal,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          themeDef.icon,
                          color: isSelected
                              ? context.faColors.action.ink.primary.selected
                              : context.faColors.action.ink.primary,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: isSelected
                                ? context.faColors.ink.primary
                                : null,
                          ),
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle,
                          color: context.faColors.ink.primary,
                          size: 20,
                        )
                      else
                        Icon(
                          Icons.circle_outlined,
                          color: context.faColors.ink.primary,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
