Pod::Spec.new do |s|

  s.name         = "Tor"
  s.version      = "0.2.4-21"
  s.summary      = "Tor framework for iOS"
  s.ios.deployment_target = '10.0'

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

  s.subspec "ULINetSocket" do |sp|
    sp.source_files = "iOS-Tor/ULINetSocket/Classes/*.m"
    sp.private_header_files = "iOS-Tor/ULINetSocket/Classes/*.h"
    sp.requires_arc = false
  end

  s.source_files  = "iOS-Tor/iOS-Tor/**/*.{h,m,c}"
  s.private_header_files = "iOS-Tor/iOS-Tor/**/*.h"
  s.public_header_files = "iOS-Tor/iOS-Tor/Tor*.h"

  s.resources = "dependencies/share/*"

  s.frameworks = "MobileCoreServices", "SystemConfiguration", "Foundation", "CFNetwork"
  s.libraries = "xml2", "crypto", "curve25519_donna", "event_core", "event_extra", "event_pthreads", "event", "or-crypto", "or-event", "or", "ssl", "tor", "z"

  s.preserve_paths = "dependencies/**/*"
  s.vendored_libraries = "dependencies/lib/*.a"

  s.xcconfig = { 
    "OTHER_CFLAGS" => "-I$(SDKROOT)/usr/include/libxml2 -I$(PODS_ROOT)/Tor/dependencies/include -I$(PODS_ROOT)/Tor/dependencies/include/common -I$(PODS_ROOT)/Tor/iOS-Tor/ULINetSocket/Classes",
    "OTHER_LDFLAGS" => "-L$(PODS_ROOT)/Tor/dependencies/lib",
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
