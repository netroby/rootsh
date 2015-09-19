# RootSH 

You need wget or curl installed, choose as your like.

## Update ssh for your linux

```
wget -qO-   rootsh.xyz/update-ssh.sh   | sh
```
Or
```
curl -s1LS   rootsh.xyz/update-ssh.sh   | sh
```

## Update Git for your linux

```
wget -qO- rootsh.xyz/update-git.sh -sS  | sh
```
Or
```
curl -s1LS rootsh.xyz/update-git.sh -sS  | sh
```
## Update Emacs for your linux

```
wget -qO- rootsh.xyz/update-emacs.sh -sS  | sh
```
Or
```
curl -s1LS rootsh.xyz/update-emacs.sh -sS  | sh
```
## Generate tls self signed cert for nginx

```
wget -qO- rootsh.xyz/gentlscert.sh -sS | sh -s "*.netroby.com"
```
Or
```
curl -s1LS rootsh.xyz/gentlscert.sh -sS | sh -s "*.netroby.com"
```

