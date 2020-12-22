---
title: Linux introduction
description: Linux introduction
permalink: /guide/linuxintroduction/
author: Jordan Hoosman
layout: page
---

<style>
.tab {
    margin-left: 25px;
}
</style>

<div id="videos">
    <div id="video1" style="display:inline-block;">
        <video width="320" height="240" controls>
            <source src="https://iowastate-my.sharepoint.com/personal/jhoosman_iastate_edu/Documents/Basic%20UNIX%20Introduction.mp4?App=OneDriveWebVideo">
        </video>
    </div>
    <div id="video2" style="display:inline-block;">
        <video width="320" height="240" controls>
            <source src="https://iowastate-my.sharepoint.com/personal/jhoosman_iastate_edu/Documents/Unix%20Introduction.mp4?App=OneDriveWebVideo">
        </video>
    </div>
</div>

<b>man command</b> - Show manual for command<br>
<b>pwd</b> - Output the current directory that you are in<br>
<b>ls</b> - List the content of the current directory<br>
<div class="tab">
    <b>ls -a</b> - List all the content, including hidden files <br>
    <b>ls -l</b> - List the content and its information<br>
</div>
<b>mkdir foldername</b> – Create a new folder foldername<br>
<b>cd foldername</b> – Change the working directory to foldername<br>
<div class="tab">
    <b>cd</b> - Return to the $Home directory <br>
    <b>cd ..</b> - Go up a directory <br>
    <b>cd -</b> - Return to the previous directory<br>
</div>
<b>emacs, nano, vi</b> – Editors <br>
<b>cp sourcedestination</b> – Copy source to destination<br>
<div class="tab">
    <b>cp -r sourcedestination</b> – Copy a folder recursively fromsource to destination<br>
</div>
<b>mv source destination</b> - Move (or rename) a file from source to <i>destination</i><br>
<b>rm file1</b> - Remove file1<br>
<div class="tab">
    <b>rm -r folder</b> - Remove a folder and its content recursively<br>
</div>
<b>cat file</b> – Print contents offileon the screen<br>
<b>less file</b> - View and paginate file<br>
<b>head file</b> - Show first 10 lines of file<br>
<b>tail file</b> - Show last 10 lines of file<br>

<b>history</b> – Show the list of commands issued earlier<br>
<b>!commandnumber</b> – Reissue command number <i>commandnumber</i><br>

<b>lfs quota –g <i>firstname.lastname</i>/scinet01</b> – Showsusage and quota on <i>firstname.lastnamehome</i> directory<br>
<b>module avail</b> – Show all available software modules<br>
<b>module loadmodulename</b> – Loadmodule modulenamein your environment<br>
<b>module unloadmodulename</b> - Unloadmodule modulenamefromyour environment<br>
<b>module list</b> – Listall modules currently loaded in your environment<br>
<b>module helpmodulename</b> – Showinformation about module modulename<br>
<b>module purge</b> – Unloadall modules fromyour environment<br>
<b>salloc</b> – Request 2 logical coreson a regular compute node<br>
<b>exit</b> – Close session (should be used to close interactive session)<br>
<b>sbatch jobscript</b> – Submit jobscriptinto queue<br>
<b>squeue</b> – Show all the jobs currently running or waiting in the queue<br>
<b>sinfo</b> – Show available partitions (queues)<br>
<b>scancel jobnumber</b> – Cancel job jobnum<br>