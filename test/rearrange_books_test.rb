require 'test_helper'

class RearrangeBooksTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RearrangeBooks::VERSION
  end

  def test_that_it_has_a_run_bang_method
    assert_respond_to ::RearrangeBooks, :run!
  end

end
