class Typeape < Formula
  desc "Fast, minimal terminal typing speed test"
  homepage "https://github.com/realSUDO/typeape"
  url "https://github.com/realSUDO/typeape/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "90053e00668d8272b1a0b138979997c29b260e87720f0f2b1a748014d56e635f"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build

  def install
    system "cmake", "-B", "build", "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "build", "-j#{ENV.make_jobs}"
    system "cmake", "--install", "build"
  end

  test do
    assert_predicate bin/"typeape", :exist?
  end
end
