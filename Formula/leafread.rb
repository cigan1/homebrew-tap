class Leafread < Formula
  desc "Terminal Markdown reader with rich formatting, search, and images"
  homepage "https://github.com/cigan1/leafread"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d12c52f13f310366c42996f6e4e505465561f83c167f79bfe086b490681b05b4"
    end
    on_intel do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "662dcde317a4babbb67f64af51674fa56838078aaa0ce2d1bc16326c9db9f653"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9af797e4a918dd4b9d613c8f92a670ce3ac42c6011d2525b5652c934e5f7fd9"
    end
    on_intel do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69aa07447d12c7cd603032b217629bc578f9d702a3851783e61b55e7ba2ad381"
    end
  end

  def install
    bin.install "leafread"
  end

  test do
    (testpath/"test.md").write("# Hello\n\nA **bold** line.\n")
    assert_match "Hello", shell_output("#{bin}/leafread --no-tui --no-color test.md")
  end
end
