iOS-Tor Framework
========

iOS-Tor is a Tor framework for iOS


Build
-----
1. Open your Terminal

2. Clone the git repository

	`git clone https://github.com/mattlawer/iOS-Tor-Framework.git`

3. Make sure you've downloaded the submodules 

	`cd iOS-Tor-Framework/`
	
	`git submodule update --recursive`

4. Build libssl, libevent & libtor for iOS

	`./build-libssl.sh --noverify`
	
	`./build-libevent.sh --noverify`
	
	`./build-tor.sh --noverify`

5. Build the framework

	`cd iOS-Tor`
	
	`xcodebuild`

6. Copy the framework on your desktop (or where you like)

	`cp -R ./build/Release-iphoneos/iOS-Tor.framework ~/Desktop/`
    
    
Install
-------

Add the iOS-Tor framework to your project

also add `geoip` and `torrc` files and make sure they are in the 'Copy Bundle Resources'

Import the TorManager from iOS-Tor framework

	#import <iOS-Tor/TorManager.h>

Start TorManager

	[[TorManager defaultManager] startTor];


TODO
----

Implement the TorManagerDelegate