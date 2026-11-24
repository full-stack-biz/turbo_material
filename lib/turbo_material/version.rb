# frozen_string_literal: true

module TurboMaterial
  VERSION = '0.3.4'
  MDC_VERSION = '14.0.0'
  # SRI for MDC_VERSION's dist/*.min.{css,js}: "hash" (base64 SHA-256) from
  # https://data.jsdelivr.com/v1/packages/npm/material-components-web@<version>. Update with MDC_VERSION.
  MDC_CSS_SRI = 'sha256-YPguGDqg55HB8+tbrJBbWuiF9J+XCK7sjscaiwFMTxI='
  MDC_JS_SRI = 'sha256-8DHMt+TYs1kVcO+R+oZYTrHYIYwHUOChiQsqKb2BT3g='
end
