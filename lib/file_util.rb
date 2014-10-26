require 'digest'
require 'singleton'

class FileUtil
  include Singleton

  # Uses bash to evaluate and expand relative paths
  # (A bit ugly solution, but could not find a nice way to do this in Ruby)
  # Converts paths like `~/something` to `/Users/user1/something`
  def absolute_path(file)
    file = `eval temp='#{file}'; echo $temp`.strip
    File.absolute_path(file)
  end

  def copy(source_file, destination_file)
    source_file = absolute_path(source_file)
    destination_file = absolute_path(destination_file)

    if !File.exist?(source_file)
      puts "ERROR: missing '#{source_file}' from project"
    elsif !File.exist?(destination_file) || !same_contents?(source_file, destination_file)
      if system "cat #{source_file} > #{destination_file}"
        puts "File (updated): '#{destination_file}'"
      else
        puts "FAILED: cat #{source_file} > #{destination_file}"
      end
    else
      puts "File (no change): '#{destination_file}'"
    end
  end

  def symlink(source_file, destination_file)
    source_file = absolute_path(source_file)
    destination_file = absolute_path(destination_file)

    if !File.exist?(source_file)
      puts "ERROR: missing '#{source_file}' from project"
    else
      # If it's a symlink, make sure it points to destination_file
      if File.symlink?(destination_file)
        target = File.readlink(destination_file)
        if target != source_file
          if system "rm #{destination_file}"
            puts "Unlinked '#{destination_file}' from '#{target}'"
          end
          File.symlink(source_file, destination_file)
          puts "File (symlink made): '#{destination_file}' to #{source_file}"
        else
          puts "File (already symlinked): '#{destination_file}'"
        end
      else
        if File.exist?(destination_file)
          File.delete(destination_file)
          puts "Deleted #{destination_file} in order to symlink with #{source_file}"
          File.symlink(source_file, destination_file)
          puts "File (symlink made): '#{destination_file}' to #{source_file}"
        else
          File.symlink(source_file, destination_file)
          puts "File (symlink made): '#{destination_file}' to #{source_file}"
        end
      end
    end
  end

  def same_contents?(file1, file2)
    md5_1 = Digest::MD5.file(file1).hexdigest
    md5_2 = Digest::MD5.file(file2).hexdigest
    md5_1 == md5_2
  end
end
