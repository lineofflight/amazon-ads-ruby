# frozen_string_literal: true

module AmazonAds
  # Errors for the codes Amazon Ads documents in its ErrorCode enum
  module Errors
    # The request does not have access to the manager account provided in the registration request.
    class AccessDeniedForManagerAccount < Error; end

    # An advertiser account already exists with this display name.
    class AccountAlreadyExistsForAccountName < Error; end

    # An advertiser account already exists for this selling account.
    class AccountAlreadyExistsForSellingAccount < Error; end

    # An advertiser account already exists for the selected vendor.
    class AccountAlreadyExistsForVendor < Error; end

    # The request is not supported.
    class ActionNotSupported < Error; end

    # Too many live resources. Remove resources and try again.
    class ActiveResourceLimitExceeded < Error; end

    # Business name provided is too long.
    class AddressBusinessNameTooLong < Error; end

    # The state provided in business address is invalid.
    class AddressInvalidState < Error; end

    # New resources cannot be created within an archived parent.
    class ArchivedParentCannotCreate < Error; end

    # Resources within an archived parent cannot be edited.
    class ArchivedParentCannotEdit < Error; end

    # Archived resources cannot be edited.
    class ArchivedResourceCannotEdit < Error; end

    # The provided asset is still being processed.
    class AssetNotReady < Error; end

    # Autocreated entities cannot be edited. To complete this action, create the resource manually.
    class AutocreatedEntityCannotEdit < Error; end

    # The request is not valid considering the documented schema.
    class BadRequest < Error; end

    # Operation could not be completed due to a conflict. Please retry your request.
    class Conflict < Error; end

    # The request is too large. Consider splitting it into multiple requests.
    class ContentTooLarge < Error; end

    # Update the date to be in the future.
    class DateCannotBeInPast < Error; end

    # Update the date.
    class DateCannotBeNull < Error; end

    # Update the date to be further in the future.
    class DateTooSoon < Error; end

    # Multiple resources share the non-unique field values. Remove the non-unique field value.
    class DuplicateFieldValueFound < Error; end

    # Multiple resources share the same ID. Remove the duplicate ID.
    class DuplicateResourceIdFound < Error; end

    # Update the length to be within the required range.
    class DurationTooShort < Error; end

    # Feature has been discontinued.
    class FeatureDiscontinued < Error; end

    # The requested feature is not available.
    class FeatureNotAvailable < Error; end

    # Update the value to be within the required range.
    class FieldSizeIsAboveMaximumLimit < Error; end

    # Update the value to be within the required range.
    class FieldSizeIsBelowMinimumLimit < Error; end

    # Update the value to be within the required range.
    class FieldSizeIsOutOfRange < Error; end

    # Field value cannot be edited.
    class FieldValueCannotEdit < Error; end

    # Update the request with the required information for this resource.
    class FieldValueContainsBlocklistedWords < Error; end

    # Remove the invalid characters and try again.
    class FieldValueContainsInvalidCharacters < Error; end

    # Update the value to be within the required range.
    class FieldValueIsAboveMaximumLimit < Error; end

    # Update the value to be within the required range.
    class FieldValueIsBelowMinimumLimit < Error; end

    # Update the request with the required information for this resource.
    class FieldValueIsEmpty < Error; end

    # Update the request with the required information for this resource.
    class FieldValueIsInvalid < Error; end

    # Update the request with the required information for this resource.
    class FieldValueIsNull < Error; end

    # Update the value to be within the required range.
    class FieldValueIsOutOfRange < Error; end

    # Mismatch among resource field values.
    class FieldValueMismatch < Error; end

    # Update the request with the required information for this resource.
    class FieldValueMustBeEmptyOrNull < Error; end

    # Resource specified in the field value not found. Try again with valid value.
    class FieldValueNotFound < Error; end

    # Resource field value conflicts with existing resource. Try again with an unique field value.
    class FieldValueNotUnique < Error; end

    # The caller is not authorized to make the given request.
    class Forbidden < Error; end

    # The campaign is associated with a global campaign. Portfolio association cannot be updated on a child campaign. Please perform operation on the global campaign.
    class GlobalAttributeUpdateRestrictedPortfolio < Error; end

    # The campaign is associated with a global campaign. The state on child campaign cannot be set to archived. Please perform operation on global campaign.
    class GlobalAttributeUpdateRestrictedState < Error; end

    # The campaign is associated with a global campaign. Only one ad group can be created under this campaign.
    class GlobalCampaignSingleAdgroupLimit < Error; end

    # The server encountered an unexpected condition that prevented it from fulfilling the request.
    class InternalError < Error; end

    # The request has invalid input parameters.
    class InvalidInput < Error; end

    # The state provided in business address is invalid.
    class InvalidStateOrRegion < Error; end

    # The website url provided in business detail is invalid
    class InvalidWebsiteUrl < Error; end

    # The zip code provided in business address is invalid.
    class InvalidZipCode < Error; end

    # Address line 1 is missing in business address.
    class MissingAddressLineOne < Error; end

    # Business name is missing from business detail.
    class MissingBusinessName < Error; end

    # City is missing in business address.
    class MissingCity < Error; end

    # Country is missing in business address.
    class MissingCountryCode < Error; end

    # Phone number is missing from business detail.
    class MissingPhoneNumber < Error; end

    # State is missing in business address.
    class MissingState < Error; end

    # Website url is missing from business detail.
    class MissingWebsiteUrl < Error; end

    # Zip code is missing in business address.
    class MissingZipCode < Error; end

    # The requested resource does not exist.
    class NotFound < Error; end

    # Payment failed.
    class PaymentIssue < Error; end

    # Product is not eligible for advertising. Try again with a valid product.
    class ProductIneligible < Error; end

    # Resource does not belong to the specified parent. Try again with a valid parent ID.
    class ResourceDoesNotBelongToParent < Error; end

    # Resource ID not found. Try again with valid ID.
    class ResourceIdNotFound < Error; end

    # Update the request with the required information for this resource.
    class ResourceIsEmpty < Error; end

    # Resource is in terminal state.
    class ResourceIsInTerminalState < Error; end

    # Update the request with the required information for this resource.
    class ResourceIsNull < Error; end

    # There have been too many requests, please slow down your call rate.
    class TooManyRequests < Error; end

    # Too many resources. Remove resources and try again.
    class TotalResourceLimitExceeded < Error; end

    # The request lacks the necessary credentials.
    class Unauthorized < Error; end

    # Marketplace not supported. Try again with a supported marketplace.
    class UnsupportedMarketplace < Error; end

    # Maps Amazon's error codes to their classes
    CODES = { #: Hash[String, singleton(Error)]
      "ACCESS_DENIED_FOR_MANAGER_ACCOUNT" => AccessDeniedForManagerAccount,
      "ACCOUNT_ALREADY_EXISTS_FOR_ACCOUNT_NAME" => AccountAlreadyExistsForAccountName,
      "ACCOUNT_ALREADY_EXISTS_FOR_SELLING_ACCOUNT" => AccountAlreadyExistsForSellingAccount,
      "ACCOUNT_ALREADY_EXISTS_FOR_VENDOR" => AccountAlreadyExistsForVendor,
      "ACTION_NOT_SUPPORTED" => ActionNotSupported,
      "ACTIVE_RESOURCE_LIMIT_EXCEEDED" => ActiveResourceLimitExceeded,
      "ADDRESS_BUSINESS_NAME_TOO_LONG" => AddressBusinessNameTooLong,
      "ADDRESS_INVALID_STATE" => AddressInvalidState,
      "ARCHIVED_PARENT_CANNOT_CREATE" => ArchivedParentCannotCreate,
      "ARCHIVED_PARENT_CANNOT_EDIT" => ArchivedParentCannotEdit,
      "ARCHIVED_RESOURCE_CANNOT_EDIT" => ArchivedResourceCannotEdit,
      "ASSET_NOT_READY" => AssetNotReady,
      "AUTOCREATED_ENTITY_CANNOT_EDIT" => AutocreatedEntityCannotEdit,
      "BAD_REQUEST" => BadRequest,
      "CONFLICT" => Conflict,
      "CONTENT_TOO_LARGE" => ContentTooLarge,
      "DATE_CANNOT_BE_IN_PAST" => DateCannotBeInPast,
      "DATE_CANNOT_BE_NULL" => DateCannotBeNull,
      "DATE_TOO_SOON" => DateTooSoon,
      "DUPLICATE_FIELD_VALUE_FOUND" => DuplicateFieldValueFound,
      "DUPLICATE_RESOURCE_ID_FOUND" => DuplicateResourceIdFound,
      "DURATION_TOO_SHORT" => DurationTooShort,
      "FEATURE_DISCONTINUED" => FeatureDiscontinued,
      "FEATURE_NOT_AVAILABLE" => FeatureNotAvailable,
      "FIELD_SIZE_IS_ABOVE_MAXIMUM_LIMIT" => FieldSizeIsAboveMaximumLimit,
      "FIELD_SIZE_IS_BELOW_MINIMUM_LIMIT" => FieldSizeIsBelowMinimumLimit,
      "FIELD_SIZE_IS_OUT_OF_RANGE" => FieldSizeIsOutOfRange,
      "FIELD_VALUE_CANNOT_EDIT" => FieldValueCannotEdit,
      "FIELD_VALUE_CONTAINS_BLOCKLISTED_WORDS" => FieldValueContainsBlocklistedWords,
      "FIELD_VALUE_CONTAINS_INVALID_CHARACTERS" => FieldValueContainsInvalidCharacters,
      "FIELD_VALUE_IS_ABOVE_MAXIMUM_LIMIT" => FieldValueIsAboveMaximumLimit,
      "FIELD_VALUE_IS_BELOW_MINIMUM_LIMIT" => FieldValueIsBelowMinimumLimit,
      "FIELD_VALUE_IS_EMPTY" => FieldValueIsEmpty,
      "FIELD_VALUE_IS_INVALID" => FieldValueIsInvalid,
      "FIELD_VALUE_IS_NULL" => FieldValueIsNull,
      "FIELD_VALUE_IS_OUT_OF_RANGE" => FieldValueIsOutOfRange,
      "FIELD_VALUE_MISMATCH" => FieldValueMismatch,
      "FIELD_VALUE_MUST_BE_EMPTY_OR_NULL" => FieldValueMustBeEmptyOrNull,
      "FIELD_VALUE_NOT_FOUND" => FieldValueNotFound,
      "FIELD_VALUE_NOT_UNIQUE" => FieldValueNotUnique,
      "FORBIDDEN" => Forbidden,
      "GLOBAL_ATTRIBUTE_UPDATE_RESTRICTED_PORTFOLIO" => GlobalAttributeUpdateRestrictedPortfolio,
      "GLOBAL_ATTRIBUTE_UPDATE_RESTRICTED_STATE" => GlobalAttributeUpdateRestrictedState,
      "GLOBAL_CAMPAIGN_SINGLE_ADGROUP_LIMIT" => GlobalCampaignSingleAdgroupLimit,
      "INTERNAL_ERROR" => InternalError,
      "INVALID_INPUT" => InvalidInput,
      "INVALID_STATE_OR_REGION" => InvalidStateOrRegion,
      "INVALID_WEBSITE_URL" => InvalidWebsiteUrl,
      "INVALID_ZIP_CODE" => InvalidZipCode,
      "MISSING_ADDRESS_LINE_ONE" => MissingAddressLineOne,
      "MISSING_BUSINESS_NAME" => MissingBusinessName,
      "MISSING_CITY" => MissingCity,
      "MISSING_COUNTRY_CODE" => MissingCountryCode,
      "MISSING_PHONE_NUMBER" => MissingPhoneNumber,
      "MISSING_STATE" => MissingState,
      "MISSING_WEBSITE_URL" => MissingWebsiteUrl,
      "MISSING_ZIP_CODE" => MissingZipCode,
      "NOT_FOUND" => NotFound,
      "PAYMENT_ISSUE" => PaymentIssue,
      "PRODUCT_INELIGIBLE" => ProductIneligible,
      "RESOURCE_DOES_NOT_BELONG_TO_PARENT" => ResourceDoesNotBelongToParent,
      "RESOURCE_ID_NOT_FOUND" => ResourceIdNotFound,
      "RESOURCE_IS_EMPTY" => ResourceIsEmpty,
      "RESOURCE_IS_IN_TERMINAL_STATE" => ResourceIsInTerminalState,
      "RESOURCE_IS_NULL" => ResourceIsNull,
      "TOO_MANY_REQUESTS" => TooManyRequests,
      "TOTAL_RESOURCE_LIMIT_EXCEEDED" => TotalResourceLimitExceeded,
      "UNAUTHORIZED" => Unauthorized,
      "UNSUPPORTED_MARKETPLACE" => UnsupportedMarketplace,
    }.freeze
  end
end
