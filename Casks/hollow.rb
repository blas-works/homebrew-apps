cask "hollow" do
  version "3.9.1"

  on_arm do
    sha256 "70e7cb6ac3cf3c69d3f32f07dd4dea4008ba57f9b5d24caba8982162b6cbc4e1"
    url "https://github.com/blas-works/hollow/releases/download/v#{version}/hollow-#{version}-arm64.dmg",
        verified: "github.com/blas-works/hollow/"
  end

  on_intel do
    sha256 "be5cbf776738e663789506469136375dbbe66bca7d09c151a6884d6d25fb9c05"
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
