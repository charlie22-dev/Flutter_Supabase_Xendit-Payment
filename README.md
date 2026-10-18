# student_shop
<!-- Student E-Commerce Mobile Application with Supabase and Xendit Integration -->

A Flutter mobile application designed for campus store orders with payment processing powered by Supabase and Xendit.

## Features
- **Product Catalog**: Browse student merchandise and campus store items with real-time Supabase database integration.
- **Payment Gateway**: Seamless checkout with Xendit using Supabase Edge Functions and webhooks.
- **In-App WebView**: Built-in payment gateway view on mobile and responsive browser handling on web.
- **Order Tracking**: Real-time status tracking for completed and pending transactions.

## Getting Started

1. Set up your Supabase project credentials in `lib/config/app_config.dart`.
2. Deploy the `create-invoice` Supabase Edge Function configured with your Xendit Secret API key.
3. Run the app:
   ```bash
   flutter run
   ```

## Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Supabase Flutter Quickstart](https://supabase.com/docs/guides/getting-started/quickstarts/flutter)
- [Xendit API Docs](https://developers.xendit.co/api-reference/)
