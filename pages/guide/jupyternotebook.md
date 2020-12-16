---
title: Jupyter Notebook on Ceres
description: Jupyter
permalink: /guide/jupyternotebook/
author: Jordan Hoosman
layout: page
---

<style>
.gbox {
    background-color: darkgrey;
    border: 2px solid lightgrey;
	padding-top: 0;
	padding-bottom: 0;
}
.gbox p {
    font-weight: bold;
	margin: 0;
}
.tab {
	margin-left: 25px;
}
.tab2 {
	margin-left: 35px;
}
</style>

<p>0. (<i>If using VPN</i>) Connect to SCINet VPN (see <a href="">instructions for configuring SCINet VPN</a>)</p>
<p>1. Log into Ceres via SSH (see <a href="">Ceres Quick Start Guide</a> for instructions).</p>
<p>2. Submit the Jupyter notebook SLURM job script with the following command</p>
<div class="gbox"><p>sbatch /reference/containers/jupyter_notebook/6.0.1/jupyter_notebook.job</p></div>
<p>3. After the job has started, view the $HOME/jnotebook-JOBID.out file for login information (where JOBID is the SLURM job ID reported by the <i>sbatch</i> command)</p>
<div class="gbox">
    <p>VPN Users:</p>
    <p>1. Connect to SCINet VPN and point your web browser to http://sn-cn-1-0.scinet.ars.usda.gov:58432</p>
    <p>2. log in to Jupyter Notebook using the following credentials:</p>  
		<p class="tab">TOKEN: n+6s/gvXdOO2MLoAVkG5</p>
	<br>
    <p>SSH users:</p>
    <p>1. SSH tunnel from your workstation using the following command (macOS or Linux only;   for how to enter this in PuTTY on Windows see the Ceres Jupyter  User Guide)</p>   
        <p class="tab">ssh -N -L 8787:sn-cn-1-0:58432 jane.doe@login.scinet.science</p>
        <p class="tab">and point your web browser to http://localhost:8787</p>
    <p>2. log in to Jupyter Notebook using the following credentials:</p>   
        <p class="tab">TOKEN: n+6s/gvXdOO2MLoAVkG5</p>
    <br>
	<p>When done using Jupyter Notebook, terminate the job by:</p>
    <p>1. Exit the Session</p>
    <p>2. On the Ceres command line, issue the command</p>
		<p class="tab">scancel -f 890924</p>
</div>
<p>4. (If using VPN) Point your web browser to the listed hostname / port (in this example, http://sn-cn-1-0.scinet.ars.usda.gov:58432), then enter your SCINet user name and the temporary password (valid only for this job only; in this example n+6s/gvXdOO2MLoAVkG5)<p>
<img src="/assets/img/jupyternotebook1.png"/>
<p>5. (If using SSH Port Forwarding instead of VPN) See <i>"SSH Port Forwarding"</i> directions below for directions.</p>

### Using Jupyter Notebook

<p>1. Once logged in, users are presented their home directory.</p>
<p>2. To launch a new notebook – Click the “New” button on top left.</p>
<img src="/assets/img/jupyternotebook2.png"/>
<p>3. Select the language (Python3 in this document) or open an existing document using the file browser(If opening a new notebook click on “Untitled” next to the Jupyter logo to rename the notebook)</p>
<p>4. In a new notebook, users are presented with an empty cell. This can be used for writing and executing code or even shell commands</p>
<img src="/assets/img/jupyternotebook3.png"/>
<p>Type the command and then press CTRL + ENTER</p>
<p>To execute shell commands start with “!” followed by any shell commands</p>
<img src="/assets/img/jupyternotebook4.png"/>
<p>5. For moreinformation andofficial documentation see <a href="https://jupyter-notebook.readthedocs.io/en/stable/notebook.html">https://jupyter-notebook.readthedocs.io/en/stable/notebook.html</a></p>

### Stopping Jupyter Session

<p>1. To stop the notebook, do File → Close and Halt. This closes the tab but doesn’t stop the session</p>
<p>2. Select the tab with the main Jupyter page and press “Quit” this will stop the server and also the slurm batch job.</p>

### SSH Port Forwarding (instead of VPN)

Windows + PuTTY users
<p class="tab">1. Open a new PuTTY window</p>
<p class="tab">2. In Session > Host Name, enter: <b>login.scinet.science</b></p>
<p class="tab">3. In the category: Connection > SSH > Tunnels, enter 8787 in Source Port, the Destination hostname:port listed in the job script output (in this example: <b>sn-cn-1-0:58432</b>), click “Add”, then click “Open”</p>
<p class="tab">4. Point your browser to http://localhost:8787. Enter your SCINet user name, and one-time password listed in the job script output file.</p>
<p class="tab">5. <b>macOS / Linux users</b></p>
	<p class="tab2">1. Enter the use a new macOS/Linux terminal window and enter the SSH command listed in thejob script output file. In this example:</p>
<div class="gbox"><p>ssh -N -L 8787:sn-cn-1-0:58432 jane.user@login.scinet.science</p></div>
<p class="tab2">There will be no output after logging in. Keep the window / SSH tunnel open for the duration of the  session.</p>
<p class="tab2">2. Point your browser to http://localhost:8787. Enter your SCINet user name, and one-time token listed in the job script output file.</p>

