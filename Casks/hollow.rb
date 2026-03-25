cask "hollow" do
  version "3.10.1"

  on_arm do
    sha256 "38769704b17e9957abc2b96670e002dc335455b77f2bc47c067cf2d6ba93dd82"
    url "https://github.com/blas-works/hollow/releases/download/v#{version}/hollow-#{version}-arm64.dmg",
        verified: "github.com/blas-works/hollow/"
  end

  on_intel do
    sha256 "78a582846fbf5f325fe2d3d3c3c81108224346b95da8e3c38406436e8ca3ef6b"
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
