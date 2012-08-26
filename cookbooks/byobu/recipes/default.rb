PACKAGE = 'byobu'

# install package
package PACKAGE do
    response_file "#{PACKAGE}.seed"
    action :install
end
