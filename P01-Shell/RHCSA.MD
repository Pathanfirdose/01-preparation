User accounts
cat /etc/passwd
UID-user id
```shell
id <username>
grep -i <username> /etc/passwd
```
1.user account for normal users above 1000
2.super user UID will be 0
3.system accounts UID will be less than <100 or between 500-1000
4.service accounts like nginx

```shell
id <username>
who
last
```
# switching user

```shell
su -
su - "whoami"
sudo apt-get install nginx
cat /etc/sudoers
grep -i ^root /etc/passwd
 

cat /etc/group
GID-group id
