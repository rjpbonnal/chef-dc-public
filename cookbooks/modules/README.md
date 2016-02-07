# modules cookbook

This cookbook installs Environment Modules from
<http://modules.sourceforge.net>.  Below is the description from the Environment
Modules website:

> The Environment Modules package provides for the dynamic modification of a
> user's environment via modulefiles.
>
> Each modulefile contains the information needed to configure the shell for an
> application. Once the Modules package is initialized, the environment can be
> modified on a per-module basis using the module command which interprets
> modulefiles. Typically modulefiles instruct the module command to alter or set
> shell environment variables such as PATH, MANPATH, etc. modulefiles may be
> shared by many users on a system and users may have their own collection to
> supplement or replace the shared modulefiles.
> 
> Modules can be loaded and unloaded dynamically and atomically, in an clean
> fashion. All popular shells are supported, including bash, ksh, zsh, sh, csh,
> tcsh, as well as some scripting languages such as perl.
> 
> Modules are useful in managing different versions of applications. Modules can
> also be bundled into metamodules that will load an entire suite of different
> applications.

# Requirements

  * ark
  * build-essential

# Usage

Add recipe[modules::default] to your run list.

# Attributes

# Recipes

  * recipe[modules::default] - Provides the modulefile resource
  * recipe[modules::source] - Downloads, builds and installs environment modules from
    sourceforge.

# Resources/Providers

## modulefile

Creates a modulefile(5)

# Author

Author:: Allan Espinosa (<allan.espinosa@outlook.com>)
