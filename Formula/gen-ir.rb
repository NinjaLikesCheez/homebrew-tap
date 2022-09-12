class GenIr < Formula
  desc "Generate LLVM IR from an Xcode Build Log"
  homepage "https://github.com/NinjaLikesCheez/gen-ir"
  url "https://github.com/NinjaLikesCheez/gen-ir.git",
    tag:      "0.1.1",
    revision: "1517872be45cb4f54bc5cd37af9e3caed9ef7377"
  version_scheme 1
  head "https://github.com/NinjaLikesCheez/gen-ir.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/NinjaLikesCheez/homebrew-tap/releases/download/gen-ir-0.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey: "0c95fdab11801f9410641a15e453cd7ae18bb98813d30aa871e59f0f06191639"
  end

  depends_on xcode: ["13.0", :build]
  depends_on macos: :monterey

  uses_from_macos "swift"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install "./.build/release/gen-ir"
  end

  test do
    system "#{bin}/gen-ir", "--help"
  end
end
