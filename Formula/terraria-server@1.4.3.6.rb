class TerrariaServerAT1436 < Formula
  desc "Vanilla Terraria server"
  homepage "https://terraria.org/"
  version "1.4.3.6"
  VERSION_DOTLESS = "1436"
  url "https://terraria.org/api/download/pc-dedicated-server/terraria-server-#{VERSION_DOTLESS}.zip"
  sha256 "38523b53a32abb4f6921b80942cd0ef864bc8dfd6e56e84054426160d617ac11"
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
