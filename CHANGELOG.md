## [0.7.0] - 2026-10-01

- Add Marketing Stream v2 API
- Add Reporting v1 API
- Add Inventory Management Unified APIs
- Add download_report helper for Reporting v3
- Raise typed AmazonAds::Errors subclasses for documented error codes
- Add code to AmazonAds::Error and its pattern matching

## [0.6.0] - 2026-08-30

- Add Portfolios v3 API
- Send Accept header matching vendor-versioned request media types

## [0.5.0] - 2026-08-27

- Regenerate API classes from updated Amazon specs
- Require request body arrays in create/update/delete methods (breaking)
- Add 17 API classes
- Add ad-product-agnostic commitment endpoints
- Remove sort param from query_brand_store

## [0.4.0] - 2026-08-26

- Raise AmazonAds::Error on 4xx/5xx responses
- Preserve error response bodies
- Raise AmazonAds::Error when retries exhaust on 429
- Re-raise underlying transport errors on network failures

## [0.3.0] - 2026-08-25

- Require http ~> 6.0
- Migrate type signatures to Steep 2.0 inline RBS

## [0.2.0] - 2026-03-06

- Rewrite core: stateless API classes take access_token directly
- Remove Configuration and Client classes
- Generate 20+ API classes from OpenAPI specs
- Fix generator handling of $ref body parameters
- Add VCR-based integration tests
- Add client_id and client_secret with ENV fallback

## [0.1.0] - 2025-12-27

- Initial release
- LWA authentication with automatic token refresh
- HTTP client with retry and rate limit handling
- Profiles API
- Sponsored Products API
- OpenAPI-based code generator
- RBS type signatures

[Unreleased]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.7.0...HEAD
[0.7.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/lineofflight/amazon-ads-ruby/releases/tag/v0.1.0
