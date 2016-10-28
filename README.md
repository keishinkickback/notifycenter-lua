# Notify Center Lua's SKD

## About

Notify Center is the easiest way to push notifications to your iPhone from major Deep Learning frameworks...with a single line of code!

- Push notifications to iPhone from Torch, Tensorflow, Keras, etc.

- Notify Center allows you to use channels to easily separate messages of different training and testing workflows.

- Notify Center allows you to control which channel can show and store notifications. By default, notifications are on for all channels.

- All received notifications are securely stored and easily viewable anytime...anywhere.

- Notifications are encrypted in flight and at rest. Messages sent to your iPhone are only viewable by you.

- Notify Center provides  Python, Lua and Matlab SDKs so you can easily start sending notifications to your device with minimal setup or code.

- Mainly, Notify Center will allow you to redirect messages of your choice to your phone (as notifications) instead of printing them to the standard output. 

Stop waiting! We'll notify you!

## Installation


```bash
luarocks install notifycenter
```

Notify Center requires luacurl, so if you do not have
```bash
luarocks install luacurl
``` 

You may need to specify CURL_INCDIR on macOS.
```bash
# on macOS 10.10
luarocks install luacurl CURL_INCDIR=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift-migrator/sdks/MacOSX.sdk/usr/include/

# on Ubuntu
apt-get install libcurl4-openssl-dev
```

## Usage

First create PUSH ID on Notify Center app then pass it to `notify()`.
```bash
nc = require "notifycenter"
pushId ='628697AB-FBB9-49C7-84AD-XXXXXXXXXXXX'
nc.notify(pushId, 'Notification from Torch')
```
 
