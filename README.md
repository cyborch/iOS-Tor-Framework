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
	
	`git submodule update --init --recursive`

4. Build libz, libssl, libevent & libtor for iOS

	`./build-libz.sh`

	`./build-libssl.sh --noverify`
	
	`./build-libevent.sh --noverify`
	
	`./build-tor.sh --noverify`

5. Build the framework

	`cd iOS-Tor`
	
	`xcodebuild -sdk iphoneos`

6. Copy the framework on your desktop (or where you like)

	`cp -R ./build/Release-iphoneos/Tor.framework ~/Desktop/`
    
    
Install
-------

Add the Tor framework to your project

Import the TorManager from Tor framework

	#import <Tor/TorManager.h>

Start TorManager

	[[TorManager defaultManager] startTor];


TODO
----

Implement the TorManagerDelegate