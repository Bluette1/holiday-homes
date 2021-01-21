require 'rdoc/task'

desc 'Generate Rails API Documentation with RDoc'
RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'lib   /*.rb')
end
