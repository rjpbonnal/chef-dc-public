require File.expand_path('../support/helpers', __FILE__)

class SourceTest < MiniTest::Chef::TestCase
  def test_modules_directory_is_installed
    assert_path_exists file("/usr/local/Modules")
  end

  def test_installed_in_its_version_directory
    assert_path_exists file("/usr/local/Modules/3.2.10")
  end

  def test_ark_links_are_removed
    refute_link_exists link("/usr/local/modules")
  end
end
