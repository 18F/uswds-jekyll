---
title: Multifactor Authentication
description: A guide to setting up multifactor authentication for SCINet
permalink: /guide/multifactor/
author: Adam Rivers
layout: page
---

#### Table of Contents
* [What is Multifactor Authentication](#what-is-multifactor-authentication)
  * [Google Authenticator on Android](#google-authenticator-ga-on-android)
  * [Google Authenticator on Apple iOS iPhones and iPads](#google-authenticator-ga-on-apple-ios-iphones-and-ipads)
  * [Authentication on Your Computer Using Authy](#authentication-on-your-computer-using-authy)
* [GA account reset](#ga-account-reset)


# What is Multifactor Authentication

Federal computer systems are required to use multifactor authentication for site security. This means that a code is required in addition to a password to login to SCINet. If you're ssh-ing to Ceres cluster from a connected site (where you already had to use second factor such as PIV/CAC), you probably won't be prompted for a verification code. However the code is always required to ssh to the [Atlas cluster](https://www.hpc.msstate.edu/computing/atlas) and to use other SCINet resources, such as [SCINet Galaxy](https://scinet.usda.gov/guide/galaxy) or [SCINet Forum](https://forum.scinet.usda.gov/). It's also needed to connect to [SCINet VPN](https://scinet.usda.gov/guide/vpn).

You will need to install an app on a mobile device or a small program on your computer that will generate your verification codes. The app is initialized with your SCINet Google Authentication (GA) account, that is normally created along with your SCINet account.

To add your SCINet GA account to the app, you will need a key or a QR code, that you can find in your "Welcome to Ceres" email. 

Note: If your SCINet account was created **before January 2020**, and a GA account was never created, attempt to login to the Ceres DTN node:
```
ssh <your SCINet username>@ceres-dtn-0.scinet.usda.gov
```
At the first attempt a GA account will be created for you and you will receive an email containing a key/code that should be used to initialize GA on your mobile device.

If you have already had GA installed and initialized but now need to either re-install GA or install it on a new device, and if you saved your SMS phone number in the system, you can reset GA account by going to [https://ga.scinet.usda.gov/reset](https://ga.scinet.usda.gov/reset). After resetting your GA account you will receive an email containing a key/code that should be used to initialize GA on your mobile device.

Follow the instructions below to set up multifactor authentication on either your mobile [Android device](#google-authenticator-ga-on-android) (recommended), [Apple device](#google-authenticator-ga-on-apple-ios-iphones-and-ipads) (recommended), or [on your computer](#authentication-on-your-computer-using-authy).




## Google Authenticator (GA) on Android

### Requirements
To use Google Authenticator on your Android device, it must be running Android version 2.1 or later (other TOTP authenticators can be used if you prefer).

### Downloading the app

1. Visit Google Play.
2. Search for Google Authenticator.
3. Download and install the application.

### Setting up the app

Open the Google authenticator app on your mobile device.

![screenshot of Google Authenticator Android app setup screen](/assets/img/mfa-guide/Screenshot_20191029-105813-w300.png)


If this is the first time you have used Authenticator, click the **Add an account** button. If you already use the app and are adding a new account, choose "Add an account" from the app's menu.

![screenshot of Google Authenticator Android app Add an Account screen](/assets/img/mfa-guide/Screenshot_20191029-105840-w300.png)


There are two ways to link your device to your account. Using QR code is easier but requires a barcode scanner which you can install if you don't have it yet (Google Authenticator app will prompt you to install it). An alternative would be to use a Google Authenticator key as mentioned on the above screenshot.


### Link phone using QR code

Select Scan a barcode. If the Authenticator app cannot locate a barcode scanner app on your phone, you might be prompted to download and install one. If you want to install a barcode scanner app so you can complete the setup process, press Install then go through the installation process. Once the app is installed, reopen Google Authenticator, display QR code on your computer by clicking on the link in the "Welcome to Ceres" email and point your camera at the QR code.

![screenshot of barcode scanner app](/assets/img/mfa-guide/Screenshot_20191029-105914-w300.png)


### Link phone manually with a GA key

Select Enter a provided key, then Enter account name, which is \<your SCINet username>@ceres. Next, enter the Google Authenticator key from the "Welcome to Ceres" email into the box under Enter Key. Make sure you've chosen to make the key time-based and press "Save."

![screenshot of Google Authenticator Android app Enter Account Details screen](/assets/img/mfa-guide/Screenshot_20191029-105940-w300.png)


### Verify

To verify the application is working correctly,
```
ssh <your SCINet username>@ceres-dtn-0.scinet.usda.gov
```
Enter the verification code currently displayed in Google Authenticator, then enter your SCINet password.

If your code is correct, you will be connected to Ceres' data transfer node. If your code is incorrect and you're prompted for a verification code again, wait for a new code to be generated on your phone, then enter it on your computer. If you're still having trouble, verify that the time on your phone is correct.

After logging in the first time you will be prompted to save an SMS phone number in the system so an SMS message can be sent to you when a GA account reset is requested. 

Contact [scinet_vrsc@usda.gov](mailto:scinet_vrsc@USDA.GOV?subject=help%20with%20multifactor%20authentication) if you need assistance.



## Google Authenticator (GA) on Apple iOS iPhones and iPads

### Requirements

To use Google Authenticator on your iPhone, iPod Touch, or iPad, you must have iOS 5.0 or later. In addition, in order to set up the app on your iPhone using a QR code, you must have a 3G model or later.

### Downloading the app

1. Visit the App Store.
2. Search for Google Authenticator.
3. Download and install the application.

### Setting up the app

On your iOS device, open the Google Authenticator application. Tap the plus icon. Tap "Time Based" (label 1).

![screenshot of Google Authenticator iOS app Add Token screen with added labels](/assets/img/mfa-guide/ios-screenshot-w300.png)


There are two ways to link your device to your account. Using a QR code is easier but requires a camera. An alternative would be to use a Google Authenticator key in the Key field (label 2c in above screenshot).

### Link phone using QR code

Tap "Scan Barcode" (label 2a above) and then point your camera at the QR code on your computer screen (click on the link in the "Welcome to Ceres" email to access QR code).

### Link phone manually with a GA key

In the box next to Account (label 2b above), enter your account name, which is \<your SCINet username>@ceres . Then, enter the Google Authenticator key from the "Welcome to Ceres" email into the box next to "Key" (label 2c above) and tap "Done" (label 2d above).

### Verify

To verify the application is working correctly,
```
ssh <your SCINet username>@ceres-dtn-0.scinet.usda.gov
```
Enter the verification code currently displayed in google authenticator and then enter your password.

If your code is correct, you will be connected to Ceres' data transfer node. If your code is incorrect and you're prompted for a verification code again, wait for a new code to be generated on your phone, then enter it on your computer. If you're still having trouble, verify that the time on your phone is correct.

After logging in the first time you will be prompted to save an SMS phone number in the system so an SMS message can be sent to you when a GA account reset is requested.

Contact [scinet_vrsc@usda.gov](mailto:scinet_vrsc@USDA.GOV?subject=help%20with%20multifactor%20authentication) if you need assistance.



## Authentication on your computer using Authy

If you are unable to use a smart device for multifactor authentication you may use Authy on your PC for a second factor.

Authy can be downloaded from [https://authy.com](https://authy.com).

Click the download button then scroll down to the "Desktop" section and download the binary for your platform. (Windows or macOS)

Run the installer. This won't require administrator privileges, but it will need to be run by each user of the machine.

The installer will need to tie your login to a phone number and an email address. The phone number can be either a land line or a cell phone.

The systems will want to send you a verification number. If you are not using a cell phone please select "voice call" (not SMS) for the verification.

After making your choice a code will be shown and you should receive a call or a text which you should respond to with the code on your screen.

You are now setup and can add your SCINet GA key to Authy.

To do so click the red "+" in the Authy app and enter the key from the email you received titled "Welcome to Ceres".

You will need to enter the key from the email since Authy cannot use QR codes.

Now name the account and pick an icon.

Authy should now be displaying codes for use with Ceres. Each code is shown for 30 seconds and then a new code in generated automatically. Codes are only valid for a few seconds after they are displayed and cannot be reused.

Contact [scinet_vrsc@usda.gov](mailto:scinet_vrsc@USDA.GOV?subject=help%20with%20multifactor%20authentication) if you need assistance.

# GA account reset

Users may need to reset GA accounts when switching or reinstalling their mobile devices that have GA application installed. To be able to perform GA reset by yourself, save an SMS phone number in the system by issuing phone-collect.sh command on Ceres. This is the same process that is run automatically the first time you login. After doing that you will be able to do a self-service reset of your GA at [https://ga.scinet.usda.gov/reset/](https://ga.scinet.usda.gov/reset).

If you are unable to or do not wish to save an SMS phone number, GA account reset request will have to go though your supervisor or sponsor as we have no way of directly verifying your identity. 
