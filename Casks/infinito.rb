cask "infinito" do
  version "1.17.0"

  on_arm do
    sha256 "44056e4dbbc86c8a7682f9facef0d722904f0fc052e33b8fd1502866a9dbc538"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "a10035fd51c7f5ddbad049fc5ba489a45c0ca3449f588498f24cfcd1cbf9519c"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-x64.dmg"
  end

  name "Infinito"
  desc "Infinite canvas note-taking application"
  homepage "https://github.com/blas-works/infinito"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "infinito.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/infinito.app"]
  end

  zap trash: [
    "~/Library/Application Support/infinito",
    "~/Library/Preferences/com.infinito.app.plist",
    "~/Library/Caches/com.infinito.app",
    "~/Library/Logs/infinito",
  ]
end
