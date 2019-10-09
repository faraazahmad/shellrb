class Cp
  def self.main params
    case params[0]
    when '-r', '-R'
      #recursive copy
      FileUtils.cp_r(params[1], params[2])
    else
      params_count = params.count
      sources = params[0..params_count - 2]
      destination = params[params_count - 1]
      sources.each do |source|
        FileUtils.cp(source, destination)
      end
    end
  rescue SystemCallError => e
    puts "cp: " + e.message
  end
end
