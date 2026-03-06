# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  # Amazon Ads API - Profiles
  class Profiles < API
    # Gets a profile specified by identifier.
    #: (Integer) -> HTTP::Response
    def get_profile_by_id(profile_id)
      request(:get, "/v2/profiles/#{profile_id}")
    end

    # Gets a list of profiles.
    # @rbs api_program: String -- Filters response to include profiles that have permissions for the specified Advertising API program only. Setting `apiProgram=billing` filters the response to include only profiles to which the user and application associated with the access token have permission to view or edit billing information.
    # @rbs access_level: String -- Filters response to include profiles that have specified permissions for the specified Advertising API program only. Currently, the only supported access level is `view` and `edit`. Setting `accessLevel=view` filters the response to include only profiles to which the user and application associated with the access token have view permission to the provided api program.
    # @rbs profile_type_filter: String -- Filters response to include profiles that are of the specified types in the comma-delimited list. Default is all types. Note that this filter performs an inclusive AND operation on the types.
    # @rbs valid_payment_method_filter: String -- Filter response to include profiles that have valid payment methods. Default is to include all profiles. Setting this filter to `true` returns only profiles with either no `validPaymentMethod` field, or the `validPaymentMethod` field set to `true`. Setting this to `false` returns profiles with the `validPaymentMethod` field set to `false` only.
    #: (?api_program: String?, ?access_level: String?, ?profile_type_filter: String?, ?valid_payment_method_filter: String?) -> HTTP::Response
    def list_profiles(api_program: nil, access_level: nil, profile_type_filter: nil, valid_payment_method_filter: nil)
      request(:get, "/v2/profiles", params: { "apiProgram" => api_program, "accessLevel" => access_level, "profileTypeFilter" => profile_type_filter, "validPaymentMethodFilter" => valid_payment_method_filter }.compact)
    end

    # Update the daily budget for one or more profiles.
    #: (?json: untyped) -> HTTP::Response
    def update_profiles(json: {})
      request(:put, "/v2/profiles", json: json)
    end
  end
end
