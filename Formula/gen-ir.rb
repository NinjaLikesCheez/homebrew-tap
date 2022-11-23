class GenIr < Formula
  desc "Generate LLVM IR from an Xcode Build Log"
  homepage "https://github.com/NinjaLikesCheez/gen-ir"
  url "https://github.com/NinjaLikesCheez/gen-ir.git",
    tag:      "0.1.3",
    revision: "21e598a509b76a439dde67bdd9ff57dcaa616d64"
  version_scheme 1
  head "https://github.com/NinjaLikesCheez/gen-ir.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/NinjaLikesCheez/homebrew-tap/releases/download/gen-ir-0.1.3"
    sha256 cellar: :any_skip_relocation, monterey: "7ab356f26bf269e984685208eadada512b44bcc42176635258894a3741eab7f4"
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
