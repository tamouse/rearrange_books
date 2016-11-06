module RearrangeBooks

  class Rearranger
    attr_accessor :dir_list, :verbose, :dry_run

    def initialize(options)
      self.dir_list = options.fetch(:dir_list)
      self.verbose  = options.fetch(:verbose)
      self.dry_run  = options.fetch(:dry_run)
    end

  end

end
