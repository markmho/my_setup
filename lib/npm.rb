require 'singleton'

class Npm
  include Singleton

  def install(package)
    if !system("which #{package}")
      system "npm -g install #{package}"
    end
  end

end
