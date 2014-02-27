PDFKit.configure do |config|
  config.wkhtmltopdf = '/Users/tesstryan/.rvm/gems/ruby-2.0.0-p247/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Letter',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost:3000" 

end 

ActionController::Base.asset_host = Proc.new { |source, request|
  if request.format.pdf?
    "#{request.protocol}#{request.host_with_port}"
  else
    nil
  end
}