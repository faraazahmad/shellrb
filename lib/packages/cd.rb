class Cd
  def self.main(params)
    path = params[0]
    Dir.chdir path
  end
end
