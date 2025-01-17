class FlutterLinux < Formula
    desc "Google’s UI toolkit for mobile, web, and desktop from a single codebase"
    homepage "https://flutter.dev"
    url "https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json"
    version "sdk"
  
    require 'json'

    option "master", "Install the latest master release"
    option "dev", "Install the latest dev release"
    option "beta", "Install the latest beta release"
    option "stable", "Install the latest stable release"
  
    def install
      puts "\n📡 Retrieving latest release...\n\n"
      releases_json = `curl -A "Flutter-linux SDK Homebrew" https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json`
      data = JSON.parse releases_json

      channel = nil

      if build.with? "master"
        channel = "master"
      elsif build.with? "dev"
        channel = "dev"
      elsif build.with? "beta"
        channel = "beta"
      else
        channel = "stable"
      end
  
      base_url = data["base_url"]
      current_latest = data["current_release"][channel]
      releases = data["releases"]
  
      result = nil
      releases.each do |release|
        if release["hash"] == current_latest
          result = release
          break
        end
      end
  
      puts "\n🎯 Found version #{channel} - #{result["version"]} - downloading...\n\n"
      `curl -A "Flutter-linux SDK Homebrew" #{base_url}/#{result["archive"]} -L -o flutter.zip`
  
      puts "\n📦 Unpacking files...\n\n"
      `tar --strip-components=1 -xvf flutter.zip`
  
      puts "\n🚧 Installing...\n"
      prefix.install Dir["packages",".git*"]
      bin.install Dir["bin/*"]
    end
  
    def post_install
      puts "\n👮‍ Updating cache folder permissions..."
      chmod "u+rw", Dir["#{prefix}/bin/cache/", "#{prefix}/bin/cache/*"]
      puts "\n🎉‍ Flutter-linux successfully installed! 👉 You may want to run flutter doctor to complete the Flutter-linux SDK setup.\n\n"
    end
  
    test do
      system bin/"flutter", "--help"
      system bin/"flutter", "create test_app"
      assert_predicate testpath/"test_app.iml", :exist?
    end
  end
