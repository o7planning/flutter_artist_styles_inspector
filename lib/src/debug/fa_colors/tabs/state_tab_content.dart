import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

class StateTabContent extends StatelessWidget {
  final String? colorPrefix; // e.g., "faColors.action.fill.primary"
  final FaColor? originColor;

  const StateTabContent({
    super.key,
    required this.colorPrefix,
    required this.originColor,
  });

  /// Helper to build a clean state matrix record line
  Widget _buildStateRow({
    required BuildContext context,
    required String stateTitle,
    required String fullTokenMethod,
    required Color resolvedColor,
  }) {
    final String hexCode =
        '#${resolvedColor.toARGB32().toRadixString(16).toUpperCase()}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.faColors.surface.standard,
        border: Border.all(color: context.faColors.stroke.subtle),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: resolvedColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: context.faColors.stroke.subtle),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stateTitle,
                  style: TextStyle(
                    color: context.faColors.ink.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: context.faColors.surface.subtle,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    fullTokenMethod,
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 11,
                      color: context.faColors.ink.technical,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            hexCode,
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: context.faColors.ink.secondary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (colorPrefix == null || originColor == null) {
      return Text("");
    }
    final String cleanPrefix = colorPrefix!.replaceFirst('context.', '');

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // --- PHẦN 1: MA TRẬN TRẠNG THÁI BIẾN ĐỔI ---
        Row(
          children: [
            Icon(Icons.waves, size: 16, color: context.faColors.ink.secondary),
            const SizedBox(width: 8),
            Text(
              'State Transformation Spectrums',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: context.faColors.ink.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildStateRow(
          context: context,
          stateTitle: 'Normal (Idle State)',
          fullTokenMethod: cleanPrefix,
          resolvedColor: originColor!,
        ),
        _buildStateRow(
          context: context,
          stateTitle: 'Hover Overlay State',
          fullTokenMethod: '$cleanPrefix.hover',
          resolvedColor: originColor!.hover,
        ),
        _buildStateRow(
          context: context,
          stateTitle: 'Pressed Down State',
          fullTokenMethod: '$cleanPrefix.pressed',
          resolvedColor: originColor!.pressed,
        ),
        _buildStateRow(
          context: context,
          stateTitle: 'Selected / Checked State',
          fullTokenMethod: '$cleanPrefix.selected',
          resolvedColor: originColor!.selected,
        ),
        _buildStateRow(
          context: context,
          stateTitle: 'Focused / Current Record State',
          fullTokenMethod: '$cleanPrefix.current',
          resolvedColor: originColor!.current,
        ),
        _buildStateRow(
          context: context,
          stateTitle: 'Dragged Element State',
          fullTokenMethod: '$cleanPrefix.dragged',
          resolvedColor: originColor!.dragged,
        ),
        _buildStateRow(
          context: context,
          stateTitle: 'Disabled Lock State',
          fullTokenMethod: '$cleanPrefix.disabled',
          resolvedColor: originColor!.disabled,
        ),
      ],
    );
  }
}
