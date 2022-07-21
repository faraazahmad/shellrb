require 'set'
require_relative 'core'

# cp command
class Cp
  def self.main params
    if params.empty?
      show_usage
      return
    end
    if params[0].upcase == '-R'
      params.shift
      copy_files(params, true)
    else
      copy_files(params)
    end
  rescue SystemCallError => e
    result = Set.new
    result.add "#{self.name.downcase}: #{e.message}"
    Core.print_result result
  end

  class << self
    private

    def copy_files(params, recursive = false)
      destination = params.pop
      sources = params
      if recursive
        FileUtils.cp_r(source_list(sources), destination)
      else
        FileUtils.cp(source_list(sources), destination)
      end
    end

    def source_list(sources)
      return sources.first if sources.length == 1
      sources
    end

    def show_usage
      result = Set.new
      result.add "usage:\t#{self.name.downcase} [-R] source_file target_file\n"
      result.add "\t#{self.name.downcase} [-R] source_file ... target_directory"
      Core.print_result result
    end
  end
end
