# frozen_string_literal: true

D = Steep::Diagnostic

target :lib do
  signature "sig"

  check "lib"

  collection_config "rbs_collection.yaml"

  library("uri")

  configure_code_diagnostics(D::Ruby.lenient)
end
