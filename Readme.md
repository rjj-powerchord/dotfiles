# .dotfiles Management
[Aaron Greenlee](https://github.com/aarongreenlee/dotfiles)

I've started with Aarons and hacked on it a bit

## Major diversions

| Aaron's Approach | Ralph's Hack | Comments |
| ---------------- | ------------ | -------- |
| Use ```/Users/arrongreenlee``` | Use ```${HOME}```| non user specific |
| n/a | ~/.gitconfig: [user] name = rjj-powerchord | Added because my github username not the same as $USER |
| n/a | ~/.bashrc: export GITUSER=$(git config --get user.name) | Added because my github username not the same as $USER |
| Host in ```${HOME}/dotfiles``` | Host in ```${GOPATH}/src/github.com/${GITUSER}/dotfiles``` | Note dependency on ${GITUSER} |

## Template Private files

Aaron defined two private files:
```
	.template.bcm
	.template.fusion
```

I'm not using BCM (Big Cloud Machine) yet, so I've left this one alone, it has a reference to a private repo.

I've added some additional enviornment variables found from grep'ing the source and have added those to this file.

My expectation is that one should:
- copy these file to a local file like:
```
cat ./.template.* > ./private
```
- edit the ```./private file```
- run the ```setup.sh``` which will copy over to ```~/.private```
-- I've then added a check in my ```.bashrc``` file to souce the ```~/.private``` file, if found.

