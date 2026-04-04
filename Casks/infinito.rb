cask "infinito" do
  version "1.14.1"

  on_arm do
    sha256 "5511bf5d8150b03004870625da6fb4733ad72cbc992414ed0e5293c12f04f407"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-arm64.dmg",
        verified: "github.com/blas-works/infinito/"
  end

  on_intel do
    sha256 "f8657ad7dee62a2955842da9b5b436074df1e4333dce5df0355e7ebe4db02cf9"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-x64.dmg",
        verified: "github.com/blas-works/infinito/"
  end

  name "Infinito"
  desc "Infinite canvas note-taking application"
  homepage "https://github.com/blas-works/infinito"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "infinito.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/infinito.app"]
  end

  zap trash: [
    "~/Library/Application Support/infinito",
    "~/Library/Preferences/com.infinito.app.plist",
    "~/Library/Caches/com.infinito.app",
    "~/Library/Logs/infinito",
  ]
end
