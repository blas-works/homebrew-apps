cask "hollow" do
  version "4.1.1"

  on_arm do
    sha256 "fef20a01344facf1bdbfa13d214a57f864de6d7ba2f6a4d41545a0bd846f8554"
    url "https://github.com/blas-works/hollow/releases/download/v#{version}/hollow-#{version}-arm64.dmg",
        verified: "github.com/blas-works/hollow/"
  end

  on_intel do
    sha256 "fb06cc6c114f59ec65fa55a709c9cba8390f1e2252f236932be3c625bdcaf004"
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
