class Typeape < Formula
  desc "Fast, minimal terminal typing speed test"
  homepage "https://github.com/realSUDO/typeape"
  url "https://github.com/realSUDO/typeape/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "5b9da96a66b13ac5b646e5f2be9861c351cd1b3b6ea5a06437c61695d5d458d9"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build

  def install
    system "cmake", "-B", "build", "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=#{prefix}",
                    "-DTYPEAPE_DATA_DIR=#{share}/typeape/data"
    system "cmake", "--build", "build", "-j#{ENV.make_jobs}"
    system "cmake", "--install", "build"
  end

  test do
    assert_predicate bin/"typeape", :exist?
  end
end
