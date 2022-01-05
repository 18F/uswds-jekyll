---
title: Dropbox with RClone 
description: dropbox rclone
permalink: /guide/rclonedropbox/
author: Jordan Hoosman
layout: page
---

<style>
.cmd {
    background-color: rgb(245, 245, 245);
    padding: 5px;
}
.vbar {
	border-left: 5px solid lightgrey;
	padding-left: 10px;
}

.ptext {
    color: #BF0D5A
}
</style>

Paths are specified as <span class="ptext">remote:path</span>

Dropbox paths may be as deep as required, eg <span class="ptext">remote:directory/subdirectory.</span>

The initial setup for dropbox involves getting a token from Dropbox which you need to do in your browser. <span class="ptext">rclone config</span> walks you through it.

Here is an example of how to make a remote called <span class="ptext">remote.</span> First run:

<div class="cmd">
    rclone config
</div>

<div class="vbar">
    $ rclone config<br>
    2019/02/12 16:28:28 NOTICE: Config file "/home/netid/.config/rclone/rclone.conf" not found - using defaults<br>
    No remotes found - make a new one<br>
    n) New remote<br>
    s) Set configuration password<br>
    q) Quit config<br>
    n/s/q> n
</div>

The "name" can be whatever you like, you will need to type it in every rclone command so you might want to keep it short and memorable.

<div class="vbar">
    name> db_remote
</div>

At the time this documentation was created Dropbox is 9

<div class="vbar">
    Type of storage to configure.<br>
    Enter a string value. Press Enter for the default ("").<br>
    Choose a number from below, or type in your own value<br>
	...<br>
    9 / Dropbox<br>
    \ "dropbox"<br>
	...<br>
	Storage> 9
</div>

The next 2 parameters should be left blank

<div class="vbar">
	Enter a string value. Press Enter for the default ("").<br>
	client_id><br>
	Dropbox App Client Secret<br>
	Leave blank normally.<br>
	Enter a string value. Press Enter for the default ("").<br>
	client_secret><br>
</div>

Enter n for advanced config

<div class="vbar">
	Remote config<br>
	Use auto config?<br>
	* Say Y if not sure<br>
	* Say N if you are working on a remote or headless machine<br>
	y) Yes<br>
	n) No<br>
	y/n> n<br>
</div>

Now you'll need to use the computer that you're working on or another <b>designated computer</b> that has a browser <i><b>and</b></i> rclone

Type the command below on your <b>designated computer<b>'s terminal:
<div class="vbar">
	rclone authorize "dropbox"
</div>

Wait for the page to load. If it doesn't load click the link it provided.

Sign in.

<img src="/assets/img/dropbox_rclone1.png">

Click <b>Allow</b>

<img src="/assets/img/dropbox_rclone2.png">

<img src="/assets/img/dropbox_rclone3.png">

Return to the terminal and copy the token.

<div class="vbar">
	Got code<br>
	Paste the following into your remote machine ---><br>
	{"access_token":"XXXXXXXXXXXXXXXXXXXXXXXXXXXXX_XXXX_XXXXXXXXXXXXXXXXXXXXXXXXXXXXX","token_type":"bearer","expiry":"0001-01-01T00:00:00Z"}<br>
	<---End paste<br>
</div>

Paste the token into your terminal and hit enter

Type y to confirm the token

<div class="vbar">
	y) Yes this is OK<br>
	e) Edit this remote<br>
	d) Delete this remote<br>
	y/e/d> y<br>
</div>

Now you're all set!