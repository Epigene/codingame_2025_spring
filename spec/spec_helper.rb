require "bundler/setup"
require "codinbot"
require "pry"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    stub_const("LOG_LEVEL", 2)
  end
end

RSpec::Matchers.define_negated_matcher :not_change, :change
RSpec::Matchers.alias_matcher :contain, :include

