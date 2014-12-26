Gem::Specification.new do |s|
  s.name        = 'shop'
  s.version     = '0.0.3'
  s.licenses    = ['MIT']
  s.summary     = "hello"
  s.description = "Shop Inventory"
  s.authors     = ["Sujay Gavhane"]
  s.email       = 'rubycoder@example.com'
  s.files       = [
                    'lib/shop.rb',
                   'lib/shop_inventory.rb',
                   'lib/shop/version.rb',
                   'lib/modules/customer.rb',
                   'lib/modules/shopkeeper.rb',
                   'lib/modules/file_handling.rb',
                  ]
  s.require_paths = ['lib', 'bin']
  s.homepage    = 'https://rubygems.org/gems/shop'
  s.executables = ['shop']
end
