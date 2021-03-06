# Global MKPKG definitions for the TABLES packages.

$set XFLAGS	= "$(XFLAGS) -p tables"
$set XVFLAGS	= "$(XVFLAGS) -p tables"
$set LFLAGS	= "$(LFLAGS) -p tables"

$ifeq (HOSTID, vms) then
$set FITSIO_HOST_DEP = "vms"
$else
$set FITSIO_HOST_DEP = "unix"
$endif

# Set up the NO_UNDERSCORE macro that can be used by C programs.
# vms = old VMS systems, _vax = openVMS on a Vax, _alpha = openVMS on the Alpha
$ifeq (MACH, hp700, rs6000, vms, _vax, _alpha)
    $set XFLAGS = "$(XFLAGS) -DNO_UNDERSCORE"
$endif

$ifeq (MACH, sparc) then
$include "tables$lib/mkpkg.sf.SUN4"
$else $ifeq (MACH, ssun) then
$include "tables$lib/mkpkg.sf.SUN4"
$else $ifeq (MACH, i386) then
$include "tables$lib/mkpkg.sf.I386"
$else $ifeq (MACH, mc68020) then
$include "tables$lib/mkpkg.sf.SUN3"
$else $ifeq (MACH, f68881) then
$include "tables$lib/mkpkg.sf.SUN3"
$else $ifeq (MACH, mips) then
$include "tables$lib/mkpkg.sf.DS3100"
$else $ifeq (MACH, alpha) then
$include "tables$lib/mkpkg.sf.OSF1"
$else $ifeq (MACH, hp700) then
$include "tables$lib/mkpkg.sf.HP700"
$else $ifeq (MACH, redhat) then
$include "tables$lib/mkpkg.sf.RHUX"
$else
$include "tables$lib/mkpkg.sf.VMS"
$end
