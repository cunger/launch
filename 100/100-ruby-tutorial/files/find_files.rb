
def find_files(dir_path, ext)
  dir = Dir.new(dir_path)
  while file = dir.read do
    puts file.to_s if File.extname(file) == ext
  end
end

find_files("../arrays", ".rb")
