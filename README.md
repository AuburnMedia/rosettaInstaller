# rosettaInstaller
Installer for Rosetta 2 on older Mac Silicon devices ⚠️ Does not support Intel Macs!

> Rosetta 2 enables a Mac with Apple silicon to use apps built for a Mac with an Intel processor.
[Apple Support](https://support.apple.com/en-au/HT211861)

## Get started
```
git clone https://github.com/AuburnMedia/rosettaInstaller
./install.sh
```

## Requirements
bash

sh

curl

git

chmod

brew?

### File tree

```
.
└── rosettaInstaller/
    ├── install.sh # run this to start
    ├── .DS_Store # DO NOT REMOVE
    └── sourcefiles # chflags nohidden ./hiddenfiles/
        ├── uninstall.sh # uninstall script
        └── installer.sh # install script for Rosetta 2
```
