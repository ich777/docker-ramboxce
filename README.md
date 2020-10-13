# Rambox Community Edition  in Docker optimized for Unraid
Rambox Community Edition is a Free, Open Source messaging and emailing app that combines common web applications into one. A few of the supported platforms are Airdroid, Discord, Duo, Gmail, Hangouts, ICQ, Steam and many many more.

**UPDATE:** The container will check on every start/restart if there is a newer version available.

## Env params
| Name | Value | Example |
| --- | --- | --- |
| DATA_DIR | Folder for configfiles and the application | /ramboxce |
| UID | User Identifier | 99 |
| GID | Group Identifier | 100 |
| UMASK | Umask value for new created files | 0000 |
| DATA_PERMS | Data permissions for config folder | 770 |

## Run example
```
docker run --name Rambox-CE -d \
	-p 8080:8080 \
	--env 'UID=99' \
	--env 'GID=100' \
	--env 'UMASK=0000' \
	--env 'DATA_PERMS=770' \
	--volume /mnt/cache/appdata/ramboxce:/ramboxce \
	ich777/ramboxce
```

This Docker was mainly edited for better use with Unraid, if you don't use Unraid you should definitely try it!
 
#### Support Thread: https://forums.unraid.net/topic/83786-support-ich777-application-dockers/