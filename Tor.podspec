Pod::Spec.new do |s|

  s.name         = "Tor"
  s.version      = "0.2.4-21"
  s.summary      = "Tor framework for iOS"

  s.description  = <<-DESC
    Tor is free software and an open network that helps you defend
    against traffic analysis, a form of network surveillance that
    threatens personal freedom and privacy, confidential business 
    activities and relationships, and state security.
  DESC

  s.homepage     = "https://www.torproject.org/"
  s.license      = { :type => "Other", :file => "LICENSE" }

  s.author             = { "Anders Borch" => "anders@cyborch.com" }

  s.source       = {
    :git => "https://github.com/cyborch/iOS-Tor-Framework.git",
    :tag => "#{s.version}"
  }

  s.subspec "no-arc" do |sp|
    sp.source_files = "iOS-Tor/ULINetSocket/Classes/*.m"
    sp.requires_arc = false
  end

  s.source_files  = "iOS-Tor/iOS-Tor/**/*.{h,m,c}"
  s.public_header_files = "iOS-Tor/iOS-Tor/Tor*.h"

  s.resources = "dependencies/share/*"

  s.frameworks = "MobileCoreServices", "SystemConfiguration", "Foundation", "CFNetwork"
  s.libraries = "xml2", "crypto", "curve25519_donna", "event_core", "event_extra", "event_pthreads", "event", "or-crypto", "or-event", "or", "ssl", "tor", "z"

  s.preserve_paths = "dependencies/**/*"

  s.xcconfig = { 
    "HEADER_SEARCH_PATHS" => ["$(SDKROOT)/usr/include/libxml2", "$(SRCROOT)/../dependencies/include"],
    "OTHER_LDFLAGS" => "-L$(SRCROOT)/../dependencies/lib"
  }

  s.dependency "ASIHTTPRequest", "~> 1.8.1"

  s.prepare_command = <<-CMD
    git submodule update --init --recursive
    ./build-libz.sh
    ./build-libssl.sh --noverify
    ./build-libevent.sh --noverify
    ./build-tor.sh --noverify
  CMD

end
