cask "mira" do
  version "1.3.2"

  on_arm do
    sha256 "4d67dc67cd1c096738fcf1d93bd6b3d44ff416fd6588e7ff9dd278e49bedd3e4"
    url "https://github.com/blas-works/mira/releases/download/v#{version}/mira-#{version}-arm64.dmg",
        verified: "github.com/blas-works/mira/"
  end

  on_intel do
    sha256 "b00489bff772118d9a4110aa8f9c49a479f38d4f1ba8cccb6b8c62a325d5f5c2"
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
