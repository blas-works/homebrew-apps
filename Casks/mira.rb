cask "mira" do
  version "1.0.0"

  on_arm do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    url "https://github.com/blas-works/mira/releases/download/v#{version}/mira-#{version}-arm64.dmg",
        verified: "github.com/blas-works/mira/"
  end

  on_intel do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    url "https://github.com/blas-works/mira/releases/download/v#{version}/mira-#{version}-x64.dmg",
        verified: "github.com/blas-works/mira/"
  end

  name "Mira"
  desc "Lightweight screenshot and annotation tool"
  homepage "https://github.com/blas-works/mira"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Mira.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Mira.app"]
  end

  zap trash: [
    "~/Library/Application Support/mira",
    "~/Library/Preferences/com.mira.app.plist",
    "~/Library/Caches/com.mira.app",
    "~/Library/Logs/mira",
  ]
end
