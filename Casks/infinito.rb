cask "infinito" do
  version "1.9.2"

  on_arm do
    sha256 "d855f68c26f959dc61b29760ee555a2d34f9211d487af9d486f9f510d4e123ba"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-arm64.dmg",
        verified: "github.com/blas-works/infinito/"
  end

  on_intel do
    sha256 "158b72501ffb0904594fd1f96083a331d1de460800cfb5de96329379f9248bf9"
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
