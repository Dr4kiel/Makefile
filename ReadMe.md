
## Beginning

Init the project with the following command:
```sh
make init
```

## Usage

All the commands are listed below:
```sh
make [all|clean|debug|export|help|init]
```

## Description

```Makefile
all: build the project

clean: remove the build directory

debug: build the project with debug flags

export: clean the project and export it as a zip file

init: initialize the src folder of the project
```









## Tree

The tree of the project is the following:
```
.
├── Makefile
├── build
│   ├── obj
│   │   ├── main.o
│   │   └── etc...
│   └── executable
├── src
│   ├── main.c
│   └── etc...
└── etc...
```

## Example

```python
# To init your project (the src folder will be created)
make init

# Add source files in the src folder

# build the project
make
# or 
make all
# or if you want to use a debugger
make debug

# All objects files will be created in the folder build/obj
# The executable file will be created in the folder build/

# if you want to export your project (a zip file will be created at the root of the project)
make export

# if you want to clear your project (objects and executable will be removed)
make clean
```

## About

> Author : [Drakiel](https://github.com/Dr4kiel)
> Group : [IUT Laval](https://iut-laval.univ-lemans.fr/fr/index.html)
