require 'formula'

class DockerComposeMagento < Formula
  url "https://github.com/digitalspacestdio/docker-compose-magento.git", :using => :git
  version "0.1.0"
  revision 3

  depends_on 'coreutils'
  depends_on 'rsync'
  depends_on 'mutagen-io/mutagen/mutagen'

  def install
    #bin.install "docker-compose-magento"
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"docker-compose-magento"
  end

  def caveats
      s = <<~EOS
        docker-compose-magento was installed
      EOS
      s
    end
end
