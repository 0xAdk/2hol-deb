# About
My foray into making a deb file

This was made when someone asked for help with playing the game on a chrome
book turns out chrome books are able to install deb files into it's own little
linux virtual machine it runs, and is able to run the game at playable framerate

# Package Structure
```
/
└── usr
    └── share
        ├── 2hol
        ├── applications
        └── icons
```

The game gets installed into the users `/usr/share/2hol` directory with it's
desktop file and icons being installed into `/usr/share/applications`, and
`/usr/share/icons` respectively.

# Building
Make sure you have a directory containing the client build of 2hol in
`src/2hol_client_build` (this is what gets copied into `/usr/share/2hol`).

Then run the make file.

The version of the game is taken from the `dataVersionNumber.txt` file in the game client's directory
