class GenIr < Formula
  desc "Generate LLVM IR from an Xcode Build Log"
  homepage "https://github.com/veracode/gen-ir"
  url "https://github.com/veracode/gen-ir.git",
    tag:      "0.3.2",
    revision: "d9b97c560b51a576daf6e5f6ce3cfd07518bc052"
  version_scheme 1
  head "https://github.com/veracode/gen-ir.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/veracode/homebrew-tap/releases/download/gen-ir-0.3.1"
    sha256 cellar: :any_skip_relocation, monterey: "ea7adb19e151e663e571031545314e5fa5c9f60c0eb1026969bb1bea2d41d8d9"
  end

  depends_on xcode: ["13.0", :build]
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install "./.build/release/gen-ir"
  end

  test do
    system "#{bin}/gen-ir", "--help"
  end
end
