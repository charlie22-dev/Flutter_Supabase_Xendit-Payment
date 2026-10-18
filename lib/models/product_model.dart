/// Represents an item available for purchase in the store.
/// Mapped directly from the Supabase `products` database table.
class Product {
  /// Unique identifier of the product in the database.
  final int id;

  /// Display name of the product item.
  final String name;

  /// Price of the product in PHP (Philippine Peso).
  final num price;

  /// Remote URL pointing to the product's image preview.
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  /// Factory constructor to parse and map raw JSON/database records from Supabase
  /// into a strongly-typed [Product] instance with fallback default values.
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      name: map['name'] ?? 'Unnamed Item',
      price: map['price'] ?? 0,
      imageUrl: map['image_url'] ?? '',
    );
  }
}