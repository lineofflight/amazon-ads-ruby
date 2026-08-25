# frozen_string_literal: true

D = Steep::Diagnostic

target :lib do
  check "lib", inline: true

  signature "sig"

  collection_config "rbs_collection.yaml"

  library("erb")
  library("json")
  library("uri")
  library("yaml")

  configure_code_diagnostics(D::Ruby.default)
end
