Before do
  if ENV['ZALENIUM']
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => ["--disable-infobars"]})
    driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', desired_capabilities: caps
    @browser = Watir::Browser.new driver
  else
    case ENV['BROWSER']
    when 'firefox'
      @browser = Watir::Browser.new :firefox
    when 'chrome'
      @browser = Watir::Browser.new :chrome
    else
      @browser = Watir::Browser.new :ie
    end
  end
end


After do |scenario|
  if scenario.failed?
    time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    filename = "error-#{@current_page.class}-#{time}.png"
    @current_page.save_screenshot(filename)
    embed(filename, 'image/png')
  end
  @browser.close
end
