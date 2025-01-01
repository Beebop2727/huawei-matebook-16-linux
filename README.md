<h1 align="left">huawei-matebook-16-linux</h1>

###

<p align="left">I have recently picked up a huawei matebook 16 which seems to have an annoying bug on mostly any linux distrubution that the bluetooth module disables itself when the device goes into hibernation/suspend<br><br>I have tested the following solution to be working to write a script to disable and enable the bluetooth module using rfkill<br><br>the following script was tested working on Huawei Matebook 16 running ZorinOS.</p>

###

<h2 align="left">Solution</h2>

###

<p align="left">run the command which will list the status of the bluetooth module<br><br>rfkill list<br><br>by disabling and reenabling the bluetooth module, it should come back up again for you to be able to use the module again once the device goes to sleep<br><br>try<br><br>rfkill block bluetooth<br><br>then<br><br>rfkill unblock bluetooth<br><br>as I am lazy, there must be a way to automate this wehen the device next goes to sleep which led me down writing a script to automate this process. run the following command which will create our script in an area which will run when the device wakes up<br><br>sudo nano /usr/lib/systemd/system-sleep/enable-bluetooth.sh<br><br>and paste in the folloiwng script:<br><br>#!/bin/bash<br><br>case "$1" in<br>    post)<br>        # This runs after the system resumes from suspension<br>        echo "Enabling Bluetooth after resume..."<br>        rfkill block bluetooth<br>        sleep 3<br>        rfkill unblock bluetooth<br>        systemctl start bluetooth<br>        ;;<br>esac<br><br>Finally, make the script executable by running<br><br>sudo chmod +x /usr/lib/systemd/system-sleep/enable-bluetooth.sh<br><br>Now test that the script works by typing<br><br>sudo systemctl suspend<br><br>wake the device up and hopefully your bluetooth module should now should wake up when your device wakes up :)</p>
```
test
```


###
