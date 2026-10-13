cask "infinito" do
  version "1.18.0"

  on_arm do
    sha256 "7af098e665bd09899eda3cb3f3d885dead622b7aef261b23500ba7cb010397d4"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "5292923aadc1144e3abf6d41bd7756403799e598cac05aa2b34d09b6035e932a"
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
