require "test_helper"

module RearrangeBooks
  class RearrangerTest < Minitest::Test

    def setup

    end

    def teardown

    end

    def test_it_copies_options
      options = {
        dir_list: %w[a b c],
        verbose: false,
        dry_run: true
      }

      rearranger = ::RearrangeBooks::Rearranger.new(options)
      assert rearranger.dry_run
      refute rearranger.verbose
      assert_equal(%w[a b c], rearranger.dir_list)
    end

  end
end
