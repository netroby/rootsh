# RootSH 

You need wget installed, we do not using curl, because curl do not support very strict tls certificate, which may not very security. so we using wget

## Update ssh for your linux

```
wget -qO-   https://rootsh.xyz/update-ssh.sh   | sh
```
## Update Git for your linux

```
wget -qO- http://rootsh.xyz/update-git.sh -sS  | sh
```
## Update Emacs for your linux

```
wget -qO- http://rootsh.xyz/update-emacs.sh -sS  | sh
```
## Generate tls self signed cert for nginx

```
wget -qO- http://rootsh.xyz/gentlscert.sh -sS | sh -s "*.netroby.com"
```

