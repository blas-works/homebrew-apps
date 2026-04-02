cask "infinito" do
  version "1.10.0"

  on_arm do
    sha256 "6eb901c3123ca1fd5b85483ffdf1263803ed5d7090dce23bcd46af7eed42b7bf"
    url "https://github.com/blas-works/infinito/releases/download/v#{version}/infinito-#{version}-arm64.dmg",
        verified: "github.com/blas-works/infinito/"
  end

  on_intel do
    sha256 "7a995aa7e448b28084a53de26a782c6db24f20c09045edf941f13da13234f2bd"
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
