class TInventoryPart {
  final String id;
  final String name;
  final DateTime addedOn;
  final List<String> tags;
  final String? imageUrl;

  TInventoryPart({
    required this.id,
    required this.name,
    required this.addedOn,
    required this.tags,
    this.imageUrl,
  });
}
