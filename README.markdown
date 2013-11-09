#better_file

[![Build Status](https://travis-ci.org/bobtfish/puppet-better_file.png)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
4. [Usage - Using the better_file function](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

A better_file function which slurps files from full paths or puppet:/// uris 

##Module Description

The puppet builtin file() function is severely limited as it will only operate on fully qualitied paths.

This is [a](http://projects.puppetlabs.com/issues/1946) [well](http://projects.puppetlabs.com/issues/2771) [known](http://projects.puppetlabs.com/issues/4749) [issue](http://projects.puppetlabs.com/issues/5158).

This function fixes (or at least hacks around) that limitation for the common cases.

##Usage

###With a full path name

    better_file('/a/full/path')

Works exactly like the built in file() function

###With a module uri

    better_file('puppet:///modules/my_module/myfile')

Will resolve 'my_module' to a path on disk in the current environment, and will look inside the files/ subdirectory for that module

For example if your modules are in /etc/puppet/modules, then the above will try to find the file in /etc/puppet/modules/files/myfile

### With a files uri

    better_file('puppet:///files/myfile')

This will assume that your files are located under the _$confdir/files_ (e.g. /etc/puppet/files)

##Limitations

Unless your fileserver is configured to serve the 'files' repository from _$confdir/files_ then
_puppet:///files/_ uris will not work.

Custom fileserver modules are unsupported. 

##Development

Patches are welcome!

Please open a pull request on github :)

