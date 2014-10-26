require 'singleton'

class Jar
  include Singleton

  JAR_DIRECTORY = File.join(ENV['HOME'], "my_setup", "jars")

  def download(url)
    jar_filename = url.split("/").last
    jar_file = File.join(JAR_DIRECTORY, jar_filename)
    if File.exists?(jar_file)
      puts "Already installed (jar): #{jar_filename} at #{jar_file} "
    else
      puts "Downloading (jar): #{jar_filename} to #{jar_file} "
      system "curl -o #{jar_file} #{url}"
    end
  end

  def latest_version_cmd(jar_name_prefix)
    "java -jar ~/.jars/$(ls ~/.jars | grep #{jar_name_prefix} | sort | tail -n 1)"
  end
end
