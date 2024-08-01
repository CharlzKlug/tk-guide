#!/usr/bin/env tclsh
# Can a directory contain files that comprise multiple versions of a package?

# Yes, it can!

lappend auto_path ./lib

package require -exact testPackage 0.1
::testPackage::testFunc
