# How to change your computer name?

```bash
Open System Preferences.
Click on Sharing.
Click on the field Computer Name: at the top.
Highlight the current name and enter a new one.
Press enter or click anywhere in the window outside of the text field to set the new name.
```

# Setting the Mac hostname or computer name from the terminal?

```bash
Open a terminal.
Type the following command to change the primary hostname of your Mac:
This is your fully qualified hostname, for example myMac.domain.com

sudo scutil --set HostName <new host name>
Type the following command to change the Bonjour hostname of your Mac:
This is the name usable on the local network, for example myMac.local.

sudo scutil --set LocalHostName <new host name>
If you also want to change the computer name, type the following command:
This is the user-friendly computer name you see in Finder, for example myMac.

sudo scutil --set ComputerName <new name>
Flush the DNS cache by typing:

dscacheutil -flushcache
Restart your Mac.
```
