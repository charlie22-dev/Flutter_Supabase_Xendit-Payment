import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product_model.dart';

/// Service responsible for managing Supabase database interactions,
/// invoking Edge Functions, and communicating with the Xendit payment flow.
class PaymentService {
  /// Singleton client instance for interacting with Supabase tables and functions
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Fetches all active products from the Supabase `products` table,
  /// ordered sequentially by item ID.
  Future<List<Product>> fetchProducts() async {
    final response = await _supabase
        .from('products')
        .select()
        .order('id', ascending: true);

    return (response as List)
        .map((item) => Product.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  /// Triggers the `create-invoice` Supabase Edge Function to generate
  /// a new Xendit invoice URL and creates an initial PENDING record in the `orders` table.
  /// Returns a map containing `invoice_url` and `external_id`.
  Future<Map<String, dynamic>> createInvoice(Product product) async {
    final FunctionResponse res = await _supabase.functions.invoke(
      'create-invoice',
      body: {
        'product_name': product.name,
        'amount': product.price,
      },
    );

    if (res.status != 200) {
      throw Exception('Failed to create invoice: ${res.data}');
    }

    return res.data as Map<String, dynamic>;
  }

  /// Checks the current payment status of an order using its [externalId].
  /// Typically called after the user completes payment on the Xendit checkout screen.
  /// Returns 'PAID', 'PENDING', or 'EXPIRED'.
  Future<String> checkOrderStatus(String externalId) async {
    final record = await _supabase
        .from('orders')
        .select('status')
        .eq('external_id', externalId)
        .single();

    return record['status'] ?? 'PENDING';
  }

  /// Retrieves the complete list of order history records from the `orders` table,
  /// sorted from newest to oldest by creation date.
  Future<List<Map<String, dynamic>>> fetchOrders() async {
    final response = await _supabase
        .from('orders')
        .select()
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(response);
  }
}