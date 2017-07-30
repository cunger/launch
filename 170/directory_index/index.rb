require 'sinatra'

get '/' do
  # Get all files in the public folder.
  folder = settings.public_folder
  @files = files_in(folder)
  @files = @files.map { |file| [File.basename(file), file.sub(folder, '')] }

  # Sort them.
  @order = params[:order] || 'asc'
  @files = @files.sort_by { |pair| pair.first }
  @files = @files.reverse if @order == 'desc'

  # Render.
  erb :files
end

helpers do
  IGNORE = ['.', '..']

  def files_in(path)
    files = []
    Dir.entries(path).each do |entry|
      next if IGNORE.include?(entry)
      entry = path + '/' + entry
      files << entry if File.file?(entry)
      files += files_in(entry) if File.directory?(entry)
    end
    files
  end
end
