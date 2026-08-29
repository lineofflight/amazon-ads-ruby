## [0.6.0] - 2026-08-30

- Add Portfolios v3 API (list/create/update/budget usage)
- Send Accept header matching vendor-versioned request media types

## [0.5.0] - 2026-08-27

- Regenerate API classes from updated Amazon specs
- Require request body arrays in create/update/delete methods (breaking)
- Add 17 API classes: manager/advertiser/selling accounts, geo locations, location indexes, deal preferences, reserved target pricings, supplier proposals suite
- Add ad-product-agnostic commitment endpoints; /dsp variants remain as deprecated aliases
- Remove sort param from query_brand_store (dropped upstream)

## [0.4.0] - 2026-08-26

- Raise AmazonAds::Error on 4xx/5xx responses instead of HTTP::StatusError
- Preserve error response bodies (previously lost when the connection closed)
- Raise AmazonAds::Error when retries exhaust on 429, instead of HTTP::OutOfRetriesError
- Re-raise underlying transport errors when retries exhaust on network failures

## [0.3.0] - 2026-08-25

- Require http ~> 6.0
- Migrate type signatures to Steep 2.0 inline RBS

## [0.2.0] - 2026-03-06

- Rewrite core: stateless API classes take access_token directly
- Remove Configuration and Client classes
- Generate 20+ API classes from OpenAPI specs
- Fix generator handling of $ref body parameters
- Add VCR-based integration tests
- Add client_id/client_secret with ENV fallback on AmazonAds module

## [0.1.0] - 2025-12-27

- Initial release
- LWA authentication with automatic token refresh
- HTTP client with retry and rate limit handling
- Profiles API
- Sponsored Products API
- OpenAPI-based code generator
- RBS type signatures

[Unreleased]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.5.0...HEAD
[0.5.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/lineofflight/amazon-ads-ruby/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/lineofflight/amazon-ads-ruby/releases/tag/v0.1.0
