cask "infinito" do
  version "1.8.1"

  on_arm do
    sha256 "feed63977b0f0aff2f404e40c74f8dcc6ed744b1897b57e5e9123f578bfbbac1"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-arm64.dmg",
        verified: "github.com/blas-works/infinito/"
  end

  on_intel do
    sha256 "6078019753faaeccf2e520386438b81b1d4822a2278e34a59d127490a4832200"
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
