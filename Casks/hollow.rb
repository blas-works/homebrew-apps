cask "hollow" do
  version "4.0.0"

  on_arm do
    sha256 "101726381fd0e87bf18c403e500d4f17ac69faa3409f547552179edfc16dac8d"
    url "https://github.com/blas-works/hollow/releases/download/v#{version}/hollow-#{version}-arm64.dmg",
        verified: "github.com/blas-works/hollow/"
  end

  on_intel do
    sha256 "cf8199c2e9628f8a322a545a2fc0cef8641f86d19f688c92fec73de5a8d79b1e"
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
