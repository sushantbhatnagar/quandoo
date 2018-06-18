Before do
  @browser = Watir::Browser.new :chrome
end

# After do |scenario|
#   if scenario.failed?
#     time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
#     filename = "error-#{@current_page.class}-#{time}.png"
#     @current_page.save_screenshot(filename)
#     embed(filename, 'image/png')
#   end
#   @browser.close
# end
