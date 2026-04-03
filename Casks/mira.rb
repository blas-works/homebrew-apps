cask "mira" do
  version "1.5.1"

  on_arm do
    sha256 "5699f58ddf0162d61155cb7464efdd9b68750a934d8493156d4deb5b088b7a36"
    url "https://github.com/blas-works/mira/releases/download/v#{version}/mira-#{version}-arm64.dmg",
        verified: "github.com/blas-works/mira/"
  end

  on_intel do
    sha256 "1ee698511252797aa58f86ef2989b22d85645837e188ee24c44d36ecdb1438f5"
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
