require 'rspec'
require 'page-object'
require 'watir'

require 'data_magic'
require 'fig_newton'

require 'require_all'
require_all 'lib'

World(PageObject::PageFactory)
