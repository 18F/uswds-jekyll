---
title: Multifactor Authentication
description: A guide to setting up multifactor authentication for SCINet
permalink: /guide/multifactor/
author: Adam Rivers
layout: page
---


# What is multifactor authentication

Federal computer systems are required to use multifactor authentication for site security. This means that a code is requires in addition  to a password to login to scinet resources.

You will need an app on a mobile device or a small program on your computer to get your login code.

## Google Authenticator on Android


### Requirements
To use Google Authenticator on your Android device, it must be running Android version 2.1 or
later (other TOTP authenticators can be used if your prefer).

### Downloading the app

1. Visit Google Play.
2. Search for Google Authenticator.
3. Download and install the application.

### Setting up the app

After you attempt to login to the Ceres DTN node (`ssh ceres-dtn-1.scinet.science`) for the first time, a
GA account will be created for you and you will receive an email containing code that should be
used to initialize GA on your mobile device.

If you have already had GA installed and initialized but now need to either re-install GA or
install it on a new device, and if you saved your SMS phone number in the system, you can reset
GA account by going to [https://ga.scinet.science/reset](https://ga.scinet.science/reset). After resetting GA your account you will receive an email containing a code that should be used to initialize GA on your mobile device.
On your Android device, open the Google Authenticator application.

Open the Google authenticator app. If this is the first time you have used Authenticator, click the **Add an account** button. If you already use the app and are adding a new account, choose "Add an account" from the app's menu.

![](/assets/img/Screenshot_20191029-105813.png)

There are two ways to link your device to your account. Using QR code is easier but requires a
barcode scanner which you can install if you don't have it yet (Google Authenticator app will
prompt you to install it). An alternative would be to use the Google Authenticator code listed in
the second line of the above page.

![](/assets/img/Screenshot_20191029-105840.png)

### Link phone using QR code

Select Scan account barcode (label 1a). If the Authenticator app cannot locate
a barcode scanner app on your phone, you might be prompted to download and install one. If you
want to install a barcode scanner app so you can complete the setup process, press Install (label
2a) then go through the installation process. Once the app is installed, reopen Google
Authenticator, point your camera at the QR code in your email.

![](/assets/img/Screenshot_20191029-105914.png)


### Link phone manually

Using Google Authenticator code: Select Manually add account, then Enter
account name, which is <your username>@ Ceres. Next, enter the Google
Authenticator code on your computer screen into the box under Enter key. Make sure
you've chosen to make the key Time based and press "Save."

![](/assets/img/Screenshot_20191029-105940.png)

### Verify
To verify the application is working correctly, ssh to `ceres-dtn-1.scinet.science`
Enter the verification code currently displayed in google authenticator then enter your SCINet password.

If your code is correct, you will be connected to Ceres. If your code is incorrect, try
generating a new verification code on your phone, then entering it on your computer.
If you're still having trouble, you might want to verify that the time on your phone is
correct or read about common issues.

After logging in the first time you will be prompted to save an SMS phone number in
the system if you have not done so earlier.


## Google Authenticator on Apple iOS iPhones and iPads


### Requirements

To use Google Authenticator on your iPhone, iPod Touch, or iPad, you must have iOS 5.0 or later. In addition, in order to set up the app on your iPhone using a QR code, you must have a 3G model or later.

### Downloading the app

Visit the App Store.

Search for Google Authenticator. Download and install the application. Setting up the app
After you attempt to login to the Ceres DTN node (`ssh ceres-dtn-1.scinet.science`)  for the first time, a GA account will be created for you and you will receive an email containing code that should be used to initialize GA on your mobile device.

If you have already had GA installed and initialized but now need to either re-install GA or install it on a new device, and if you saved your SMS phone number in the system, you can reset GA account by going to [https://ga.scinet.science/reset](https://ga.scinet.science/reset). After resetting your GA account you will receive an email containing a code that should be used to initialize GA on your mobile device.

On your iOS device, open the Google Authenticator application. Tap the plus icon.
Tap Time Based (label 1).

![](/assets/img/ios-screenshot.png)

There are two ways to link your device to your account. Using QR code is easier but requires a camera. An alternative would be to use the Google Authenticator code listed in the second line of the above page.

### Link phone using QR code

Tap "Scan Barcode" (label 2a) and then point your camera at the QR code on your computer screen.

### Link phone manually

In the box next to Account (label 2b), enter your account name, which is <your username>@ Ceres . Then, enter the Google Authenticator code from your into the box next to Key (label 2c) and tap "Done" (label 2d).

### Verify
To verify the application is working correctly, ssh to ceres-dtn-1.scinet.science Enter the verification code currently displayed in google authenticator
Enter your password

If your code is correct, you will be connected to Ceres. If your code is incorrect, try generating a new verification code on your phone, then entering it on your computer. If you're still having trouble, you might want to verify that the time on your phone is correct or read about common issues.

After logging in please save an SMS phone number in the system by running the command `phone-collect.sh` if you have not done so earlier.


## Authentication on your computer using Authy

If you are unable to use a smart device for MFA you may use Authy on your PC for a second factor.

Authy can be downloaded from: https://authy.com.

Click the download button then scroll down to the "Desktop" section and download the binary for your platform. (Windows or macOS)

Run the installer.  This won't require administrator privileges, but it will need to be run by each user of the machine.

The installer will need to tie your login to a phone number and an email address. The phone number can be either a land line or a cell phone.

The systems will want to send you a verification number.  If you are not using a cell phone please select "voice call" not SMS for the verification.

After making your choice a code will be shown and you should receive a call or a text which you should respond to with the code on your screen.

You are now setup and can add your Ceres MFA code to Authy.

To do so click the Red + in the Authy app and enter the code from the email you received titled 'Welcome to Ceres'.

You will need to enter the code from the email, Authy cannot use QR codes.

Now name the account and pick an icon.

Authy should now be displaying codes for use with Ceres.  Each code is shown for 30 seconds and then a new code in generated automatically.  Codes are only valid for a few seconds after they are displayed and cannot be reused.
