# Niri

Library and CLI tool for monitoring the [Niri socket](https://github.com/YaLTeR/niri/wiki/IPC).

## Usage

You can browse the [Niri reference](https://aylur.github.io/libastal/niri).

### Get Data

Get outputs, workspaces, and windows from the default object as arrays...

```c
import Niri from "AstalNiri"
niri = niri.get_default()

// Loop through
niri.windows.forEach(w => { // do stuff })
niri.workspaces.forEach(w => { // do stuff })
niri.outputs.forEach(o => { // do stuff })
```

or even iterating through them in layers.
```c
for o in niri.outputs {
  for ws in o.workspaces {
    for win in ws.windows {
      print("window ", win.name, " on output ", ws.idx, " from output ", o.name)
    }
  }
}
```

### Send Actions
```c
import Niri from "AstalNiri"
// All actions are available through Niri.msg
Niri.msg.focus_workspace_by_name("media")
// Some object specific actions can also be called through the object 
niri = niri.get_default()
mediaWs = niri.get_workspace(3)
mediaWs.focus()
```

## Installation

1. install dependencies

:::code-group

```sh [<i class="devicon-archlinux-plain"></i> Arch]
sudo pacman -Syu meson vala json-glib gobject-introspection
```

```sh [<i class="devicon-fedora-plain"></i> Fedora]
sudo dnf install meson gcc valac json-glib-devel gobject-introspection-devel
```

```sh [<i class="devicon-ubuntu-plain"></i> Ubuntu]
sudo apt install meson valac libjson-glib-dev gobject-introspection
```

:::

2. clone repo

```sh
git clone https://github.com/aylur/astal.git
cd astal/lib/niri
```

3. install

```sh
meson setup build
meson install -C build
```

:::tip
Most distros recommend manual installs in `/usr/local`,
which is what `meson` defaults to. If you want to install to `/usr`
instead which most package managers do, set the `prefix` option:

```sh
meson setup --prefix /usr build
```

:::
