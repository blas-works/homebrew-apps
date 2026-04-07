cask "infinito" do
  version "1.15.0"

  on_arm do
    sha256 "309920eb14d821c3302c4291630ae1e9e0e3f0e3577303c0a19911413a25c687"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-arm64.dmg",
        verified: "github.com/blas-works/infinito/"
  end

  on_intel do
    sha256 "4440a685a85b9261b753a2afb81d4a7f1672d45ab6266c3af7ee3261b0cf85dd"
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
