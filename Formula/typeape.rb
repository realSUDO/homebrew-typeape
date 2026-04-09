class Typeape < Formula
  desc "Fast, minimal terminal typing speed test"
  homepage "https://github.com/realSUDO/typeape"
  url "https://github.com/realSUDO/typeape/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "08764f1c8459e8a7d5233a46a21451fb97ba800c9cf11b869b2093919ab23879"
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
