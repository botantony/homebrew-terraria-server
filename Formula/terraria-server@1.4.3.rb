class TerrariaServerAT143 < Formula
  desc "Vanilla Terraria server"
  homepage "https://terraria.org/"
  version "1.4.3"
  VERSION_DOTLESS = "143"
  url "https://terraria.org/api/download/pc-dedicated-server/terraria-server-#{VERSION_DOTLESS}.zip"
  sha256 "964bcaf1d746b193dfa24c5fa0ef49a54469ba86342fca8efc84fd640de86292"
  license "Proprietary"

  uses_from_macos "unzip"

  def install
    cd buildpath do
      cp "Mac/Terraria Server.app/Contents/MacOS/TerrariaServer.bin.osx", "Linux/"

      rm "Linux/TerrariaServer"
      if OS.mac?
        rm "Linux/TerrariaServer.bin.x86_64"
        mv "Linux/TerrariaServer.bin.osx", "Linux/TerrariaServer"
      else
        rm "Linux/TerrariaServer.bin.osx"
        mv "Linux/TerrariaServer.bin.x86_64", "Linux/TerrariaServer"
      end

      chmod "+x", "Linux/TerrariaServer"

      libexec.install Dir[buildpath/"Linux/*"]
      (bin/"TerrariaServer#{VERSION_DOTLESS}").write <<~EOS
        #!/bin/bash
        cd "#{libexec}" || exit
        exec "#{libexec}/TerrariaServer" "$@"
      EOS
      bin.install_symlink bin/"TerrariaServer#{VERSION_DOTLESS}" => "terraria-server-#{VERSION_DOTLESS}"
    end
  end
end