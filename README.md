# POLAROID

![polaroid-camera](./polaroid-image.jpg)

## Install Polaroid

in terminal, paste the command:

### Linux
```
git clone https://github.com/Gabrielsoac/polaroid.git
cd polaroid/src
npm install
cd ..
chmod +x install.sh
./install.sh
```

### MacOS
```
git clone https://github.com/Gabrielsoac/polaroid.git
cd polaroid/src
npm install
cd ..
chmod +x install.sh
./install-mac.sh
```

## Transform your photos with Polaroid ;)

in terminal, use the command:

- The first argument is a path with the photo name
- The second argument is a path with the output name file

Exemple, enter /home/gab/family.png in first parameter and /home/gab/family-polaroid.png

The family.png is a photo that will be tranform in polaroid

```
polaroid -i <path/filename.png> -o <path/polaroid-filename.png>
```

> ALERT: Keep the same extension name (PNG or JPEG)

For more options
```
polaroid --help or -h
```

## Uninstall Polaroid :(

### Linux
```
chmod +x uninstall.sh
./uninstall.sh
```

### MacOs
```
chmod +x uninstall.sh
./uninstall-mac.sh
```