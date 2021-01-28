begin
require 'rdoc/task'
rescue LoadError => e
  raise e unless ENV['RAILS_ENV'] == "production"
end

desc 'Generate Rails API Documentation with RDoc'
RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'lib   /*.rb')
end
