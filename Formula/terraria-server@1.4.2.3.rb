class TerrariaServerAT1423 < Formula
  desc "Vanilla Terraria server"
  homepage "https://terraria.org/"
  version "1.4.2.3"
  VERSION_DOTLESS = "1423"
  url "https://terraria.org/api/download/pc-dedicated-server/terraria-server-#{VERSION_DOTLESS}.zip"
  sha256 "12bd93494a31a1487384af1d6e86ee52edce72e2f093e90ee9eaa516eabaa462"
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
