class PixelPlanner < Formula
  desc "Automate project plans written in Markdown"
  homepage "https://github.com/ivannagy/pixel-planner"
  url "https://files.pythonhosted.org/packages/source/p/pixel-planner/pixel-planner-0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_AFTER_PYPI_UPLOAD"
  license "Apache-2.0"

  depends_on "python@3.11"

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-69.0.3.tar.gz"
    sha256 "be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/pixel-planner", "--help"
    
    # Test template initialization
    testpath = "test-project.md"
    system "#{bin}/pixel-planner", "init", "--out", testpath, "--project", "Test Project"
    assert_predicate testpath, :exist?
    assert_match "# Test Project - High Level Plan", File.read(testpath)
  end
end