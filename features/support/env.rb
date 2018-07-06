require 'rspec'
require 'page-object'
require 'watir'

require 'data_magic'
require 'fig_newton'

require 'require_all'
require_all 'lib'

require 'pry'

binding.pry

World(PageObject::PageFactory)
