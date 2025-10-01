# V1: 05/06/2025

> [!QUOTE]
> Give a man a distribution, feed him for a while. Teach him how to configure
> his own editor, feed him for life.

This is the **configuration** folder for my neovim. The way the project is
structured is as follows:

> [!TIP]
>├── init.lua
>├── lazy-lock.json
>├── lua
>│   ├── config
>│   │   ├── keymaps.lua
>│   │   ├── options.lua
>│   │   └── lazy.lua
>│   └── plugins
>└── README.md.lua

- _init.lua_ contains initialisation files.
- _lua/_ folder contains mostly everything.
    - the plugins folder is where each plugin has it's own lua file for
    - structured configuration.
    - The config folder is for lazy, some keybindings, and default options

- This is a headline.
    - [X] This is a checked box
    - [ ] This is an unchecked box.

> [!NOTE]
> This was sourced from [MrJakob](https://www.youtube.com/watch?v=TrbZlA4UIFU)

# This is another heading
## This is a nested heading
### This is nested even more
##### You get the point
