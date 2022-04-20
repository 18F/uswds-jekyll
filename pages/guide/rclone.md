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
pre{
    background-color: #EBECE4; 
} 
</style>

Rclone is already installed on the DTNS and all of the compute nodes. Please do not use rclone from the headnode. Attempting to do so will remind you to use the others.<br>
The rclone home page is <a href="https://rclone.org">https://rclone.org/</a>

### Getting Ready
In order to use Rclone on Ceres its necessary to have it installed on your local machine as well.  This is needed to generate an authentication token.<br>

### rclone installation on Windows

Go to the web page at <a href="https://rclone.org/downloads/">https://rclone.org/downloads/</a> and find the Windows installer. Download it and install rclone. Once installed, proceed to the configuration section below.

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

(the mkdir command is safe to run, even if the directory already exists)
Remove the leftover files.

<div class="code"><p>cd .. && rm -rf rclone-*-osx-amd64 rclone-current-osx-amd64.zip</p></div>

### Configuration of rclone on windows or osX

<div style="margin-left:25px;">
	<p>1. Open a Windows command prompt (cmd) or macOS Terminal</p>
	<p>2. Type</p>
	<div class="code"><p>rclone authorize "box"</p></div>
	<p>3. On the web page that shows up, click on <b>Use Single Sign On (SSO)</b></p>
	<p>4. Enter your USDA email address</p>
	<p>5. Do the eAuthentication thing</p>
	<p>6. Click on the <b>Grant access to Box</b> button</p>
	<p>7. Go back to the command prompt window, an authentication token should be there. Copy this including the braces {“access_token”:“ABCDEF...}</p>
</div>

### rclone configuration on SciNet

<p>1. Type</p>
<div class="code"><p>rclone config</p></div>

<p>2. Type <b>n</b> for <b>n) New remote</b></p>
<p>3. For <b>name></b> enter any name <i>e.g.</i> <b>usdabox</b></p>
<p>4. For <b>Storage></b> you can find the number, but it is easier to just type <b>box</b></p>
<p>5. For <b>client_id></b>, <b>client_secret></b>, <b>box_config_file</b>, and <b>access_token</b> leave blank, just hit enter</p>
<p>6. For <b>box_sub_type></b> enter <b>enterprise</b></p>
<p>7. For <b>Edit advanced config</b> enter <b>n</b></p>
<p>8. For <b>Remote config, Use auto config?</b> enter <b>n</b></p>
<p>9. For <b>result</b> Paste the text from the last step of the above rclone guide section "Configuration of rclone on windows and osX" and hit enter</p>
<p>10. Type <b>y</b> for <b>y) Yes this is OK</b></p>
<p>11. Type <b>q</b> to quit</p>

### Test

<p>1. Test directory listing using the <b>name></b> you selected earlier:</p>
<div class="code"><p>rclone lsd usdabox:</p></div>
<p>2. Test file listing</p>
<div class="code"><p>rclone lsl usdabox: | head</p></div>

### Commands

<p>1. For description of commands available see <a href="https://rclone.org/docs/#subcommands">https://rclone.org/docs/#subcommands</a></p>
<p>2. You installed the rclone manual page earlier, so you can also do</p>
<div class="code"><p>man rclone</p></div>
<p>3. Acommon case might be to backup your SciNet project directory to box. You could do this with:</p>
<div class="code"><p>rclone copy /project/bogus_genome usdabox:/scinetbackup/bogus_genome --verbose</p></div>

### Advanced commands

<p>This advanced guide assumes you have read the previous page and have some familiarity with rclone already.

<p>Rclone supports "overlay" filesystems which can be then be overlayed in multiple layers. 

<p>In this guide we will discuss the "crypt" and "chunk" overlays.  Using these 2 in combination can overcome virtually all of the limitations of any of the remote services.  i.e.. no 5, 10, or 15GB limit per file, no restrictions on special characters in filenames, etc. The overlays also provide some data protection by doing md5 checksums on the files transferred, if desired.  You should very much desire this.

<p>The process here is:

<ol>
<li>Create a basic store</li>
<li>Apply a crypt overlay.  This gets you encryption and works around filename limitations.</li>
<li>Apply a chunk overlay.  This gets around file size limitations.</li>
</ol> 

<p>We are going to assume you have  already created a basic functional remote, In this case mine is called "google:"

<p>First we create a folder in the remote to hold our encrypted data.  I called mine "crypt"

<div class="code">$ rclone mkdir google:crypt </div>

<p>Next run rclone config choosing crypt as the remote type and then use the name of your new folder as the path.  You will want to encrypt the directory names to avoid character limitation issues in the path. 

<p>You must remember the password(s) you chose here. Your data will not be recoverable by anyone if your forget or lose it. There is no "password recovery."

<pre>$ rclone config

Current remotes:

 

Name                 Type
====                 ====
boxsecret            crypt
boxsecretchunked     chunker
cybox                box
google               drive
onedrive             onedrive
onedrivechunker      chunker
onedrivecrypt        crypt

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> n
name> googlecrypt

Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value

 1 / 1Fichier
   \ "fichier"
 2 / Alias for an existing remote
   \ "alias"
 3 / Amazon Drive
   \ "amazon cloud drive"
 4 / Amazon S3 Compliant Storage Provider (AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, etc)
   \ "s3"
 5 / Backblaze B2
   \ "b2"
 6 / Box
   \ "box"
 7 / Cache a remote
   \ "cache"
 8 / Citrix Sharefile
   \ "sharefile"
 9 / Dropbox
   \ "dropbox"
10 / Encrypt/Decrypt a remote
   \ "crypt"
11 / FTP Connection
   \ "ftp"
12 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
13 / Google Drive
   \ "drive"
14 / Google Photos
   \ "google photos"
15 / Hubic
   \ "hubic"
16 / JottaCloud
   \ "jottacloud"
17 / Koofr
   \ "koofr"
18 / Local Disk
   \ "local"
19 / Mail.ru Cloud
   \ "mailru"
20 / Mega
   \ "mega"
21 / Microsoft Azure Blob Storage
   \ "azureblob"
22 / Microsoft OneDrive
   \ "onedrive"
23 / OpenDrive
   \ "opendrive"
24 / Openstack Swift (Rackspace Cloud Files, Memset Memstore, OVH)
   \ "swift"
25 / Pcloud
   \ "pcloud"
26 / Put.io
   \ "putio"
27 / QingCloud Object Storage
   \ "qingstor"
28 / SSH/SFTP Connection
   \ "sftp"
29 / Transparently chunk/split large files
   \ "chunker"
30 / Union merges the contents of several remotes
   \ "union"
31 / Webdav
   \ "webdav"
32 / Yandex Disk
   \ "yandex"
33 / http Connection
   \ "http"
34 / premiumize.me
   \ "premiumizeme"
Storage> crypt

** See help for crypt backend at: https://rclone.org/crypt/ **

Remote to encrypt/decrypt.
Normally should contain a ':' and a path, eg "myremote:path/to/dir",
"myremote:bucket" or maybe "myremote:" (not recommended).
Enter a string value. Press Enter for the default ("").
remote> google:crypt
How to encrypt the filenames.
Enter a string value. Press Enter for the default ("standard").
Choose a number from below, or type in your own value
 1 / Don't encrypt the file names.  Adds a ".bin" extension only.
   \ "off"
 2 / Encrypt the filenames see the docs for the details.
   \ "standard"
 3 / Very simple filename obfuscation.
   \ "obfuscate"
filename_encryption> 
Option to either encrypt directory names or leave them intact.
Enter a boolean value (true or false). Press Enter for the default ("true").
Choose a number from below, or type in your own value
 1 / Encrypt directory names.
   \ "true"
 2 / Don't encrypt directory names, leave them intact.
   \ "false"
directory_name_encryption> 1
Password or pass phrase for encryption.
y) Yes type in my own password
g) Generate random password
n) No leave this optional password blank
y/g/n> y
Enter the password:
password:
Confirm the password:
password:
Password or pass phrase for salt. Optional but recommended.
Should be different to the previous password.
y) Yes type in my own password
g) Generate random password
n) No leave this optional password blank
y/g/n> n
Remote config
--------------------
[googlecrypt]
type = crypt
remote = google:crypt
directory_name_encryption = true
password = *** ENCRYPTED ***
--------------------
y) Yes this is OK
e) Edit this remote
d) Delete this remote
y/e/d> y
Current remotes:
 
Name                 Type
====                 ====
boxsecret            crypt
boxsecretchunked     chunker
cybox                box
google               drive
googlecrypt          crypt
onedrive             onedrive
onedrivechunker      chunker
onedrivecrypt        crypt
 
e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q
$ rclone ls googlecrypt:
$
</pre>

<p>At this point you have a working encryption overlay.  You will want to add a "chunking" overlay on top on that.
As before first create a folder in the encrypted overlay to hold your chunked overlay.  In this case I called mine "chunk"

<pre>$ rclone mkdir googlecrypt:chunk </pre>
<p>Now create a chunk overlay, the defaults should be fine.
<pre> 
$ rclone config
Current remotes:
 
Name                 Type
====                 ====
boxsecret            crypt
boxsecretchunked     chunker
cybox                box
google               drive
googlecrypt          crypt
onedrive             onedrive
onedrivechunker      chunker
onedrivecrypt        crypt
 
e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> n
name> googlechunk
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / 1Fichier
   \ "fichier"
 2 / Alias for an existing remote
   \ "alias"
 3 / Amazon Drive
   \ "amazon cloud drive"
 4 / Amazon S3 Compliant Storage Provider (AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, etc)
   \ "s3"
 5 / Backblaze B2
   \ "b2"
 6 / Box
   \ "box"
 7 / Cache a remote
   \ "cache"
 8 / Citrix Sharefile
   \ "sharefile"
 9 / Dropbox
   \ "dropbox"
10 / Encrypt/Decrypt a remote
   \ "crypt"
11 / FTP Connection
   \ "ftp"
12 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
13 / Google Drive
   \ "drive"
14 / Google Photos
   \ "google photos"
15 / Hubic
   \ "hubic"
16 / JottaCloud
   \ "jottacloud"
17 / Koofr
   \ "koofr"
18 / Local Disk
   \ "local"
19 / Mail.ru Cloud
   \ "mailru"
20 / Mega
   \ "mega"
21 / Microsoft Azure Blob Storage
   \ "azureblob"
22 / Microsoft OneDrive
   \ "onedrive"
23 / OpenDrive
   \ "opendrive"
24 / Openstack Swift (Rackspace Cloud Files, Memset Memstore, OVH)
   \ "swift"
25 / Pcloud
   \ "pcloud"
26 / Put.io
   \ "putio"
27 / QingCloud Object Storage
   \ "qingstor"
28 / SSH/SFTP Connection
   \ "sftp"
29 / Transparently chunk/split large files
   \ "chunker"
30 / Union merges the contents of several remotes
   \ "union"
31 / Webdav
   \ "webdav"
32 / Yandex Disk
   \ "yandex"
33 / http Connection
   \ "http"
34 / premiumize.me
   \ "premiumizeme"
Storage> chunker
** See help for chunker backend at: https://rclone.org/chunker/ **
 
Remote to chunk/unchunk.
Normally should contain a ':' and a path, eg "myremote:path/to/dir",
"myremote:bucket" or maybe "myremote:" (not recommended).
Enter a string value. Press Enter for the default ("").
remote> googlecrypt:chunk
Files larger than chunk size will be split in chunks.
Enter a size with suffix k,M,G,T. Press Enter for the default ("2G").
chunk_size> 
Choose how chunker handles hash sums. All modes but "none" require metadata.
Enter a string value. Press Enter for the default ("md5").
Choose a number from below, or type in your own value
 1 / Pass any hash supported by wrapped remote for non-chunked files, return nothing otherwise
   \ "none"
 2 / MD5 for composite files
   \ "md5"
 3 / SHA1 for composite files
   \ "sha1"
 4 / MD5 for all files
   \ "md5all"
 5 / SHA1 for all files
   \ "sha1all"
 6 / Copying a file to chunker will request MD5 from the source falling back to SHA1 if unsupported
   \ "md5quick"
 7 / Similar to "md5quick" but prefers SHA1 over MD5
   \ "sha1quick"
hash_type> 
Edit advanced config? (y/n)
y) Yes
n) No
y/n> 
y/n> n
Remote config
--------------------
[googlechunk]
type = chunker
remote = googlecrypt:chunk
--------------------
y) Yes this is OK
e) Edit this remote
d) Delete this remote
y/e/d> y
Current remotes:
 
Name                 Type
====                 ====
boxsecret            crypt
boxsecretchunked     chunker
cybox                box
google               drive
googlechunk          chunker
googlecrypt          crypt
onedrive             onedrive
onedrivechunker      chunker
onedrivecrypt        crypt
 
e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q 
$ rclone ls googlechunk:
</pre>

<p>You now have an encrypted chunked storage remote, that is fully md5 checksummed. 


