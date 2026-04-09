class Typeape < Formula
  desc "Fast, minimal terminal typing speed test"
  homepage "https://github.com/realSUDO/typeape"
  url "https://github.com/realSUDO/typeape/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "dc71c3e4beba678a437c4c7881ddc054a05387d4512403be2f8dcf614714ca7f"
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
