class Leafread < Formula
  desc "Terminal Markdown reader with rich formatting, search, and images"
  homepage "https://github.com/cigan1/leafread"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "246421c628939c8f08ab62095e556d3f04cb109b11ef4bb1393e448ef6ac16b5"
    end
    on_intel do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "675e39aaa35e281cbacfc5f990de3683c2ecabbcb83c224abe5a8689b503dba2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6480e57d3ce2571f799a432071de504e23573bc323af4d348e6060432b7d2633"
    end
    on_intel do
      url "https://github.com/cigan1/leafread/releases/download/v#{version}/leafread-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc314ece18a30cca687f5b44226f5b36049c4ed183a84dd9af49d52966332192"
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
