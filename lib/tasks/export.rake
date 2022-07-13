task :export do
  sh "git archive --format zip --output tmp/meboox.zip HEAD"
end
