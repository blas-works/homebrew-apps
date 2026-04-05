cask "hollow" do
  version "4.2.0"

  on_arm do
    sha256 "f456484ec7a888e5fc4a80f7a2ebb58b128936dceb1b81cf15590637b784b40a"
    url "https://github.com/blas-works/hollow/releases/download/v#{version}/hollow-#{version}-arm64.dmg",
        verified: "github.com/blas-works/hollow/"
  end

  on_intel do
    sha256 "927922e162653060ab77a2d0404fa210734911055e3c0cb444c814c9d97f0c14"
    url "https://github.com/blas-works/hollow/releases/download/v#{version}/hollow-#{version}-x64.dmg",
        verified: "github.com/blas-works/hollow/"
  end

  name "Hollow"
  desc "Desktop productivity application"
  homepage "https://github.com/blas-works/hollow"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Hollow.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Hollow.app"]
  end

  zap trash: [
    "~/Library/Application Support/Hollow",
    "~/Library/Preferences/com.hollow.app.plist",
    "~/Library/Caches/com.hollow.app",
    "~/Library/Logs/Hollow",
  ]
end
