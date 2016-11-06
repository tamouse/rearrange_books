require "rearrange_books/version"
require "rearrange_books/cli"
require "rearrange_books/rearranger"

module RearrangeBooks

  def self.run!(*args)
    @runner = Rearranger.new(Cli.start(*args))
  end

end
