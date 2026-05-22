import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

class CodeDetailView extends StatelessWidget {
  final String code;

  const CodeDetailView({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.faColors.surface.muted,
        border: Border(
          top: BorderSide(color: context.faColors.divider.strong, width: 0.8),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.code_rounded,
                size: 14,
                color: context.faColors.ink.label,
              ),
              const SizedBox(width: 8),
              Text(
                "CODE USAGE",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: context.faColors.ink.label,
                  letterSpacing: 1.1,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Clipboard.setData(ClipboardData(text: code)),
                icon: const Icon(Icons.copy_all_rounded, size: 14),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                tooltip: "Copy Code",
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TextField(
              controller: TextEditingController(text: code),
              readOnly: true,
              maxLines: null,
              style: TextStyle(
                fontFamily: 'Courier',
                fontSize: 12,
                color: context.faColors.ink.code,
              ),
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
