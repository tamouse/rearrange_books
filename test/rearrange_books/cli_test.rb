require "test_helper"

module RearrangeBooks
  class CliTest < Minitest::Test

    # TODO: WARNING!!! THIS WILL CHANGE!
    HELP_OUTPUT = <<-EOT
Commands:
  -e dirs DIRLIST    # Rearrange the ebooks found in the given directories. See help dirs for more detail
  -e help [COMMAND]  # Describe available commands or one specific command
  -e version         # Print version. Also works with --version and -V

Options:
  -n, [--dry-run], [--no-dry-run]  # Dry run (don't actually do anything, just say what will happen.)
  -V, [--verbose], [--no-verbose]  # Be verbose, say lots of things

EOT

    NO_DIRS_ERROR = <<-EOT
ERROR: "-e dirs" was called with no arguments
Usage: "-e dirs DIRLIST"
EOT

    def setup

    end

    def teardown

    end

    def test_it_gives_help_when_help_task
      assert_output(HELP_OUTPUT, "") do
        ::RearrangeBooks::Cli.start(%w[help])
      end
    end

    def test_it_sets_version_in_options_with_command
      actual = ::RearrangeBooks::Cli.start(%w[version])
      assert actual["version"]
    end

    def test_it_sets_version_in_options_with_long_option
      actual = ::RearrangeBooks::Cli.start(%w[--version])
      assert actual["version"]
    end

    def test_it_sets_version_in_options_with_short_option
      actual = ::RearrangeBooks::Cli.start(%w[-v])
      assert actual["version"]
    end

    def test_it_sets_dry_run_option_with_long_option
      actual = ::RearrangeBooks::Cli.start(%w[--dry-run a b c])
      assert actual["dry_run"], actual
    end

    def test_it_sets_recurive_option_with_long_option
      actual = ::RearrangeBooks::Cli.start(%w[--recursive a b c])
      assert actual["recursive"], actual
    end

    def test_it_sets_dry_run_option_with_short_option
      actual = ::RearrangeBooks::Cli.start(%w[-n a b c])
      assert actual["dry_run"], actual
    end

    def test_it_sets_recurive_option_with_short_option
      actual = ::RearrangeBooks::Cli.start(%w[-r a b c])
      assert actual["recursive"], actual
    end

    def test_it_complains_with_no_args
      assert_output("", NO_DIRS_ERROR) do
        ::RearrangeBooks::Cli.start()
      end
    end
    def test_it_complains_with_no_args
      assert_output("", NO_DIRS_ERROR) do
        ::RearrangeBooks::Cli.start(%w[dirs])
      end
    end

    def test_it_returns_directory_list
      expected = {
        "dry_run" => false,
        "verbose" => false,
        "recursive" => false,
        "dir_list" => ["a", "b", "c", "d"]
      }
      assert_equal(expected, ::RearrangeBooks::Cli.start(%w[dirs a b c d]))
    end
  end
end
