file = File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__
base_dir = File.expand_path(File.dirname(file))

# the cookbook path is searched in reverse order, i.e. later entries take
# precedence over earlier ones
cookbook_path [File.join(base_dir, 'cookbooks'),
               File.join(base_dir, 'site-cookbooks')]
data_bag_path File.join(base_dir, 'data-bags')
# put chef cache under /var/cache
file_cache_path File.join('/var', 'cache', File.basename(base_dir))
