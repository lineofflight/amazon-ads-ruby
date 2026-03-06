# Amazon Ads Ruby SDK

## Commands
- Test: `bundle exec rake test`
- Lint: `bundle exec rake rubocop`
- Type check: `bundle exec rake steep`
- All checks: `bundle exec rake`
- Generate rbs: `bundle exec rake rbs`

## Style
- Inline RBS
- git: 50/72, no co-author attribution
- No emojis, em dashes

## Design
- Stateless LWA: each call to `LWA#request` hits the token endpoint; the caller owns token caching
- `client_id` lives on the `AmazonAds` module (with ENV fallback), not in a Configuration object
- API classes take `access_token` directly; no in-process token management

## References
- API overview: https://advertising.amazon.com/API/docs/en-us/reference/api-overview
- SDK generation guide: https://advertising.amazon.com/API/docs/en-us/guides/get-started/generate-sdk
- v1 merged spec: https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/AmazonAdsAPIALLMerged_prod_3p.json
