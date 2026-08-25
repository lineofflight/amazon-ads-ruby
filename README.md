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

## Error handling

Responses with a 4xx or 5xx status raise `AmazonAds::Error`, which carries the full response:

```ruby
begin
  campaigns.list_campaigns
rescue AmazonAds::Error => e
  e.status         # 400
  e.response.body  # Amazon's error document
end
```

The error supports pattern matching on status:

```ruby
case error
in status: 429 then backoff
in status: 500..599 then retry
end
```

Network failures (`HTTP::ConnectionError`, `HTTP::TimeoutError`) raise as-is, whether or not retries are configured.

## Development

See [AGENTS.md](AGENTS.md).
