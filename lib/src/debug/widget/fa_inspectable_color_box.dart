import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../dialog/code_example_dialog.dart';

class FaInspectableColorBox extends StatefulWidget {
  final String tokenName;
  final Color color;
  final String codeSnippet;

  const FaInspectableColorBox({
    super.key,
    required this.tokenName,
    required this.color,
    required this.codeSnippet,
  });

  @override
  State<FaInspectableColorBox> createState() => _FaInspectableColorBoxState();
}

class _FaInspectableColorBoxState extends State<FaInspectableColorBox> {
  final _overlayController = OverlayPortalController();
  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: MouseRegion(
        onEnter: (_) => _overlayController.show(),
        onExit: (_) => _overlayController.hide(),
        child: OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: (context) => _buildInspectorOverlay(context),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: context.faColors.divider.subtle),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInspectorOverlay(BuildContext context) {
    return CompositedTransformFollower(
      link: _link,
      targetAnchor: Alignment.topCenter,
      followerAnchor: Alignment.bottomCenter,
      offset: const Offset(0, -8),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.faColors.surface.emphasized,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.faColors.divider.strong),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Action Token:",
                style: TextStyle(
                  fontSize: 10,
                  color: context.faColors.ink.label,
                ),
              ),
              Text(
                widget.tokenName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: context.faColors.ink.highlight,
                ),
              ),
              const Divider(height: 16),
              TextButton(
                onPressed: () {
                  _overlayController.hide();
                  _showCodeDetail(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: context.faColors.action.fill.primaryTonal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  minimumSize: Size.zero,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.code,
                      size: 14,
                      color: context.faColors.action.ink.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Show Detail",
                      style: TextStyle(
                        fontSize: 11,
                        color: context.faColors.action.ink.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCodeDetail(BuildContext context) {
    // Gọi cái Dialog hiển thị Code của ông giáo ở đây
    CodeExampleDialog.openDialog(
      context,
      title: widget.tokenName,
      code: widget.codeSnippet,
    );
  }
}
