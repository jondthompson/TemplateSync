#!/bin/bash
USERNAME=""
# insert username to the rsync server within the double quotes
URL=""
# insert URL to rsync server within the double quotes
PATH=""
# insert the path to the templates directory within the double quotes

# This script checks for and (if needed) creates the directories for Office 2016 templates for Word, PowerPoint and Excel

if [[ ! -e "/Library/Application Support/Microsoft/Office365/User Content.localized/Templates.localized" ]]; then
   /bin/echo "Necessary support directories for Office 2016's Word, PowerPoint and Excel templates not found."
   /bin/echo "Creating necessary support directories for Office 2016's Word, PowerPoint and Excel templates."
   /bin/mkdir -p "/Library/Application Support/Microsoft/Office365/User Content.localized/Templates.localized"
   /usr/sbin/chown root:admin "/Library/Application Support/Microsoft" && /bin/chmod 775 "/Library/Application Support/Microsoft"
   /usr/sbin/chown root:admin "/Library/Application Support/Microsoft/Office365" && /bin/chmod 775 "/Library/Application Support/Microsoft/Office365"
   /usr/sbin/chown root:admin "/Library/Application Support/Microsoft/Office365/User Content.localized" && /bin/chmod 775 "/Library/Application Support/Microsoft/Office365/User Content.localized"
   /usr/sbin/chown root:admin "/Library/Application Support/Microsoft/Office365/User Content.localized/Templates.localized" && /bin/chmod 775 "/Library/Application Support/Microsoft/Office365/User Content.localized/Templates.localized"
   /bin/echo "The necessary support directories for Office 2016's Word, PowerPoint and Excel templates have been created."
fi

rsync -e 'ssh -i /Library/Scripts/syncTemplates/rsync-key -o UserKnownHostsFile=/Library/Scripts/syncTemplates/known_hosts' -av  --delete $USERNAME@$URL:$PATH "/Library/Application Support/Microsoft/Office365/User Content.localized/Templates.localized"
