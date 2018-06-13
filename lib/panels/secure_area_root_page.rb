# Secure Area Root Page
class SecureAreaRootPage
  include PageObject
  include DataMagic

  div(:flash_message, id: 'flash')
end
