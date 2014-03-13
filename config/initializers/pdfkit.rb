PDFKit.configure do |config|
  # config.wkhtmltopdf = '/Users/tesstryan/.rvm/gems/ruby-2.0.0-p247/bin/wkhtmltopdf'
  # config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf').to_s
  config.default_options = {
    :page_size => 'Letter',
    :print_media_type => true,
    :margin_top => '1.00in',
    :margin_right => '1.00in',
    :margin_bottom => '1.00in',
    :margin_left => '1.00in',
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost" 

end 

ActionController::Base.asset_host = Proc.new { |source, request|
  if request.format.pdf?
    "#{request.protocol}#{request.host_with_port}"
  else
    nil
  end
}