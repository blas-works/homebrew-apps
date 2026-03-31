cask "mira" do
  version "1.3.1"

  on_arm do
    sha256 "abcad98a2d1bc3d7a80c5b705f885057ceb81e2a9fc8a045f03ca1c1418e0b88"
    url "https://github.com/blas-works/mira/releases/download/v#{version}/mira-#{version}-arm64.dmg",
        verified: "github.com/blas-works/mira/"
  end

  on_intel do
    sha256 "07ba68e5d1c7cffd2b437a7aa80e00ceeb3c0b6b66d37308b4697fd272f93a72"
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
