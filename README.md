# Amazon Ads

A Ruby client for the [Amazon Ads API](https://advertising.amazon.com/API/docs/en-us).

## Installation

Add to your Gemfile:

```ruby
gem "amazon-ads"
```

Or install directly:

```bash
gem install amazon-ads
```

## Configuration

Set your app credentials at the module level or via environment variables:

```ruby
AmazonAds.client_id = "your_client_id"
AmazonAds.client_secret = "your_client_secret"
```

Or set `AMAZON_ADS_CLIENT_ID` and `AMAZON_ADS_CLIENT_SECRET`.

## Usage

Request an access token via Login with Amazon (LWA):

```ruby
data = AmazonAds::LWA.request(refresh_token: "your_refresh_token")
access_token = data.fetch("access_token")
```

The caller owns token caching. Store and reuse the token until it expires.

Make requests:

```ruby
# List advertising profiles
profiles = AmazonAds::Profiles.new(region: "NA", access_token:)
profiles.list_profiles

# List campaigns under a profile
campaigns = AmazonAds::Campaigns.new(
  region: "NA",
  access_token:,
  profile_id: "123456789",
)
campaigns.list_campaigns
```

Pass `http:` to inject a configured `HTTP` client (e.g. `http: HTTP.use(logging: { logger: Logger.new($stdout) })`). Note that debug logging prints request headers, exposing access tokens.

## Error handling

Responses with a 4xx or 5xx status raise `AmazonAds::Error`, which carries the full response:

```ruby
begin
  campaigns.list_campaigns
rescue AmazonAds::Error => e
  e.status         # 400
  e.code           # "FIELD_VALUE_IS_INVALID"
  e.response.body  # Amazon's error document
end
```

When the response carries one of Amazon's documented error codes, the error is a matching subclass under `AmazonAds::Errors`:

```ruby
begin
  campaigns.list_campaigns
rescue AmazonAds::Errors::TooManyRequests
  backoff
rescue AmazonAds::Errors::Unauthorized
  refresh_token
end
```

Unknown or missing codes raise the base `AmazonAds::Error`. Reporting sends the HTTP status as its code, so its errors are always the base class.

The error supports pattern matching on status and code:

```ruby
case error
in code: "TOO_MANY_REQUESTS" then backoff
in status: 500..599 then retry
end
```

Network failures (`HTTP::ConnectionError`, `HTTP::TimeoutError`) raise as-is, whether or not retries are configured.

## Development

See [AGENTS.md](AGENTS.md).
