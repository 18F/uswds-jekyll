---
title: Transferring files between a USDA Box account and SciNet
description: Using rclone
permalink: /guide/rclone/
author: Jordan Hoosman
layout: page
---
<style>
.code {
  background-color: rgb(240, 240, 240);
  border: 1px solid grey;
  padding-left: 25px;
}
</style>

Rclone is already installed on the DTNSand all of the compute nodes. Please do not use rclone from the headnode. Attempting to do so will remind you to use the others.<br>
The rclone home page is <a href="https://rclone.org">https://rclone.org/</a>

### rclone installation on Windows

You will have to install rclone on Windows so that you can generate an authentication token for Box with the USDA VPN and eAuthentication active<br>
Go to the web page at <a href="https://rclone.org/downloads/">https://rclone.org/</a>downloads/and find the Windows installer. Download it and install rclone. Then proceed to the configuration section below.

### macOS installation 

Download the latest version of rclone.

<div class="code"><p>cd && curl -O <a href="https://downloads.rclone.org/rclone-current-osx-amd64.zip">https://downloads.rclone.org/rclone-current-osx-amd64.zip</a></p></div>

Unzip the download and cd to the extracted folder.

<div class="code"><p>unzip -a rclone-current-osx-amd64.zip && cd rclone-*-osx-amd64</p></div>

Move rclone to your $PATH. You will be prompted for your password.

<div class="code">
	<p>sudo mkdir -p /usr/local/bin</p>
	<p>sudo mv rclone /usr/local/bin/</p>
</div>

(themkdircommand is safe to run, even if the directory already exists)
Remove the leftover files.

<div class="code"><p>cd .. && rm -rf rclone-*-osx-amd64 rclone-current-osx-amd64.zip</p></div>

### Configuration of rclone on windows and osX

<div style="margin-left:25px;">
	<p>1. Open a Windows command prompt (cmd)</p>
	<p>2. Type</p>
	<div class="code"><p>3.rclone authorize "box"</p></div>
	<p>4. On the web page that shows up, click on <b>Use Single Sign On (SSO)</b></p>
	<p>5. Enter your USDA email address</p>
	<p>6. Do the eAuthentication thing</p>
	<p>7.Click on the <b>Grant access to Box</b> button</p>
	<p>8.Go back to the command prompt window, an authentication token should be there. Copy this includingthe braces {“access_token”:“ABCDEF...}</p>
</div>

### rclone configuration on SciNet

<p>1. Type</p>
<div class="code"><p>rclone config</p></div>

<p>2. Type <b>n</b> for <b>n) New remote</b></p>
<p>3. For <b>name></b> enter any name <i>e.g.</i> <b>usdabox</b></p>
<p>4. For <b>Storage></b> you can find the number, but it's easier to just type <b>box</b></p>
<p>5. For both <b>client_id></b> and <b>client_secret></b> leave blank, just hit enter</p>
<p>6. For <b>Edit advanced config</b> enter <b>n</b></p>
<p>7. For <b>Remote config, Use auto config?</b> enter <b>n</b></p>
<p>8. Paste the text from the last step from the section above that you got from your Windows computer</p>
<p>9. Type <b>y</b> for <b>y) Yes this is OK</b></p>
<p>10. Type <b>q</b> to quit</p>

### Test

<p>1. Test directory listing using the <b>name></b> you selected earlier:</p>
<div class="code"><p>rclone lsd usdabox:</p></div>
<p>2. Test file listing</p>
<div class="code"><p>rclone lsl usdabox: | head</p></div>

### Commands

<p>1. For description of commands available see <a href="https://rclone.org/docs/#subcommands">https://rclone.org/docs/#subcommands</a></p>
<p>2. You installed the rclone manual page earlier, so you can also do</p>
<div class="code"><p>man rclone</p></div>
<p>3. Acommon case might be to backup your SciNet project directory to box. You could do this withe.g</p>
<div class="code"><p>rclone copy /project/bogus_genome usdabox:/scinetbackup/bogus_genome --verbose</p></div>