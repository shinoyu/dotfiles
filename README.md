Usage.

### 1. If not set ssh key, make ssh key and apply github settings.

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Taka a look [github help](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

### 2. run.  
_Git is necessary._

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/your/dotfiles/master/init.sh) | sh"
```
