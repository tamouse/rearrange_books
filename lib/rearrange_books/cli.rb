require "thor"

module RearrangeBooks

  class Cli < Thor
    class_option :dry_run, desc: "Dry run (don't actually do anything, just say what will happen.)", type: :boolean, aliases: "-n", default: false
    class_option :verbose, desc: "Be verbose, say lots of things", type: :boolean, aliases: "-V", default: false

    map ["--version", "-v"] => :version

    desc "version", "Print version. Also works with --version and -V"
    def version()
      options.merge(version: true)
    end

    desc "dirs DIRLIST", "Rearrange the ebooks found in the given directories. See help dirs for more detail"
    long_desc <<-EOT
The 'dirs' command with a list of directories tells
the program to rearrange the multiple versions within
those directories.

You can omit the 'dirs' command keyword and just provide
the list of directories.

EOT
    method_option :recursive, desc: "recursively descend the directories (like find)", type: :boolean, aliases: "-r", default: false
    def dirs(*dir_list)
      error if dir_list.empty?
      options.merge(dir_list: dir_list)
    end

    default_task :dirs

    def method_missing(method, *args)
      args = ["dirs", method.to_s] + args
      Cli.start(args)
    end
  end

end
