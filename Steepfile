# frozen_string_literal: true

D = Steep::Diagnostic

target :lib do
  check "lib", inline: true

  collection_config "rbs_collection.yaml"

  library("uri")

  configure_code_diagnostics(D::Ruby.lenient)
end
