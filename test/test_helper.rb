require 'minitest'
require 'minitest/autorun'

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
