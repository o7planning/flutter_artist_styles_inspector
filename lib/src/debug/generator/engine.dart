class FaCodeTemplateEngine {
  static Map<String, String> getSegmentedTemplates({
    required String bg,
    required String ink,
    required String stroke,
  }) {
    return {
      'action_1':
          '''
TextButton.icon(
  style: TextButton.styleFrom(
    backgroundColor: $bg,
    foregroundColor: $ink,
    side: BorderSide(color: $stroke, width: 1.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  icon: const Icon(Icons.bolt, size: 18),
  label: const Text('Execute Action'),
  onPressed: () {},
)''',
      'action_2':
          '''
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: $bg,
    foregroundColor: $ink,
    elevation: ${bg.contains('transparent') ? '0' : '1'},
    side: BorderSide(color: $stroke),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  onPressed: () {},
  child: const Text('Confirm Operation'),
)''',
      'action_3':
          '''
Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: $bg,
    border: Border.all(color: $stroke),
    borderRadius: BorderRadius.circular(16),
  ),
  child: Text(
    'ACTION TARGET',
    style: TextStyle(color: $ink, fontSize: 11, fontWeight: FontWeight.bold),
  ),
)''',
      'surface':
          '''
Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: $bg,
    border: Border.all(color: $stroke),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text(
    'Workspace Interface Block Layout',
    style: TextStyle(color: $ink, fontSize: 16, fontWeight: FontWeight.w600),
  ),
)''',
      'bar':
          '''
Container(
  height: 60,
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    color: $bg,
    border: Border(bottom: BorderSide(color: $stroke, width: 1.5)),
  ),
  child: Row(
    children: [
      Icon(Icons.dashboard_customize, color: $ink),
      const SizedBox(width: 16),
      Text('Enterprise Suite Navigation Anchor', style: TextStyle(color: $ink, fontSize: 16, fontWeight: FontWeight.bold)),
    ],
  ),
)''',
    };
  }
}
