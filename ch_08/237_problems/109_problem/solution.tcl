#!/usr/bin/env tclsh
# Can a directory contain files that define multiple packages?

# Yes, it can!

lappend auto_path ./lib

package require testPackage
package require fooPackage

::testPackage::testFunc
::fooPackage::testFunc
