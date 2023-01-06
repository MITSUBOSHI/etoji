D = Steep::Diagnostic

target :lib do
  signature "sig"

  check "lib"

  library(
    "json"
  )

  # NOTE: Unexpected error occured like below.
  # lib/etoji.rb:16:4: [error] Syntax `case_match` is not supported in Steep
  # │ Diagnostic ID: Ruby::UnsupportedSyntax
  # │
  # └     case [with_prev, with_next]
  #       ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  configure_code_diagnostics do |hash|
    hash[D::Ruby::UnsupportedSyntax] = :information
  end
end
