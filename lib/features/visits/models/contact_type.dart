class ContactType {
  final int id;
  final String label;

  ContactType({required this.id, required this.label});

  factory ContactType.fromJson(Map<String, dynamic> json) {
    return ContactType(
      id: json['id'] as int,
      label: (json['label'] ?? '').toString(),
    );
  }
}
