require 'singleton'

class Rbenv
  include Singleton

  def install(version)
    if `rbenv versions | grep #{version}`.empty?
      puts "Installing: ruby #{version}"
      if system "rbenv install #{version}"
        puts "Installed: ruby #{version}"
      else
        puts "Error Installing: ruby #{version}"
      end
    else
      puts "Already installed: ruby #{version}"
    end
  end

  def global(version)
    if `rbenv global | grep #{version}`.empty?
      puts "Setting ruby #{version} as the globally default ruby version"
      system "rbenv global #{version}"
    else
      puts "found ruby #{version} as globally default ruby version"
    end
  end

  def installed?
    !`which rbenv`.empty?
  end

  def zsh_init_cmd
    %Q{if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi}
  end
end
