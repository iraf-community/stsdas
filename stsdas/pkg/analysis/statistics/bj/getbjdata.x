include <chars.h>
include <tbset.h>
include "../surviv.h"

# GETBJDATA -- Subroutine get_bj_data adapted from the ASURV routine datain
# and datreg/xdata AND with apologies to the columns task in IRAF. 
# This routine reads data from the input file for the Buckley-James multivariate
# problem.  The input file may be either an ascii text or a table file.

int procedure get_bj_data (filename, section, ind, x, y, nvar, ntot)

# inputs --
char	filename[SZ_FNAME] # name of file to read from
char	section[SZ_LINE] # Section field of the filespec

# outputs --
int	ind[MAX_ASDAT]	# indicator of censoring
double	x[MAX_ASVAR,MAX_ASDAT]	# data for independent variables
double	y[MAX_ASDAT]	# data for dependent variable
int	nvar		# number of independent variables
int	ntot		# number of data values(up to MAX_ASDAT)

# locals --
char	title[SZ_LINE]	# descriptive title from the data file for this dataset
int	cvar		# column number of censoring indicator to read
int	ivar[MAX_ASVAR+1] # column numbers of independent variables to read
int	dvar		# column number of dependent variable to read
int	ncol		# largest column to be read in ascii text file
char	cencol[SZ_COLNAME] # Column name of censoring indicator (tables)
char	varcol[SZ_COLNAME,MAX_ASVAR] # Column names of independent variables (tables)
char	depcol[SZ_COLNAME] # Column name of dependent variable (tables)

		# Error message if number of points greater than MAX_ASDAT
string	file_too_big "File %s contains more than %d values--too big!\n"
int	j		# loop index

# Variables for use of an ascii file
int	nchar		# number of characters converted
char	line[SZ_LINE]	# line of text
int	in		# file pointer
int	i		# loop index(to nvar)
int	open(), getline(), ctoi(), ctod(), ctowrd()

# Variables to get the column number (or name for a table)
int	junk, ip, op
pointer	sp, outstr

# Stuff for use of tables
bool	not_table
pointer	tp, tbtopn()
errchk	tbtopn
pointer	tpcen, tpvar[MAX_ASVAR], tpdep
bool	nullflag[MAX_ASDAT]
int	tbpsta()
pointer	scr

# Error status indicator for INDEF values
bool	errstat

begin

	errstat = false
	title[1] = EOS

	# Find out if this is a table or ascii file
	not_table = false
	iferr (tp = tbtopn(filename, READ_ONLY, 0))
	    not_table = true

	if (not_table) {
	    # ASCII TEXT file
	    call smark(sp)
	    call salloc(outstr, SZ_LINE, TY_CHAR)

	    # Get the column numbers
	    op = 1
	    junk = ctoi(section, op, cvar)
	    for (i=1; i<=MAX_ASVAR+1 && section[op] !=EOS; i=i+1)
		junk = ctoi(section, op, ivar[i])
	    i = i - 1
	    dvar = ivar[i]
	    nvar = i - 1
	    ncol = max(cvar, dvar)
	    do i = 1,nvar
		ncol = max(ncol, ivar[i])

	    # Open the input file
	    in = open(filename, READ_ONLY, TEXT_FILE)

	    # Read the first (and second) lines to get labels (if present)
	    nchar = getline(in, line)
	    if (line[1] == '#') {
	        # First line is label; get title and blank out the '#'
	        call strcpy(line, title, SZ_LINE)
	        title[1] = BLANK
	    } else {
	        # No title line; null out field
	        title[1] = EOS
	    }
	    # Rewind to the beginning-of-file to read the data
	    call seek(in, BOF)

	    ntot = 0
	    # Separate each line of the input file
	    while (getline(in, line) != EOF) {
	    # Skip commented out(#) lines or null lines
	        if ((line[1] != '#') && (line[1] != '\n')) {
		    ip = 1
		    ntot = ntot +1
		    if (ntot > MAX_ASDAT) {
			call eprintf(file_too_big)
			call pargstr(filename)
			call pargi(MAX_ASDAT)
			call close(in)
			call sfree(sp)
			return (ERR)
		    }
		    # Get censoring indicator and data value for each variable
		    for (i=1; i<=ncol; i=i+1) {
			if (i == cvar) 
		            nchar = ctoi(line, ip, ind[ntot])
			else if (i == dvar)
		            nchar = ctod(line, ip, y[ntot])
			else {
			    nchar = ctowrd(line, ip, Memc[outstr], SZ_LINE)
			    do j = 1,nvar {
				if (i == ivar[j]) {
				    op = 1
				    nchar = ctod(Memc[outstr], op, x[j,ntot])
				    break
			        }
			    }
			}
		    }
		    # Check for INDEF's
		    if (ind[ntot] == INDEFI || y[ntot] == INDEFD ) {
			call eprintf(" Indefinite value at point %d\n")
			call pargi(ntot)
			errstat = true
		    }
		    else {
			do j = 1,nvar {
			    if (x[j,ntot] == INDEFD) {
				call eprintf(" Indefinite value at point %d\n")
				call pargi(ntot)
				errstat = true
			    }
			}
		    }
	        }
	    }

	    # Close the file
	    call close(in)

	    call sfree(sp)

	} else {
	    # TABLE file

	    # Get the title from the header
	    iferr (call tbhgtt(tp, "title", title, SZ_LINE))
		title[1] = EOS

	    # Get the names of the columns
	    op = 1
	    junk = ctowrd(section, op, cencol, SZ_COLNAME)
	    for (i=1; i<=MAX_ASVAR+1 && section[op] != EOS; i=i+1)
		junk = ctowrd(section, op, varcol[1,i], SZ_COLNAME)
	    i = i - 1
	    call strcpy(varcol[1,i], depcol, SZ_COLNAME)
	    ncol = i - 1
	    nvar = ncol

	    ntot = tbpsta(tp, TBL_NROWS)
	    if (ntot > MAX_ASDAT) {
		call eprintf(file_too_big)
		call pargstr(filename)
		call pargi(MAX_ASDAT)
		call tbtclo(tp)
		return (ERR)
	    }

	    # Get censoring column
	    call tbcfnd(tp, cencol, tpcen, 1)
	    if (tpcen == NULL) {
		call eprintf("Column %s not found(%s)\n")
		call pargstr(cencol)
		call pargstr(filename)
		call tbtclo(tp)
		return (ERR)
	    }
	    call tbcgti(tp, tpcen, ind, nullflag, 1, ntot)
	    do j = 1,ntot {
		if (nullflag[j]) {
		    call eprintf(" Indefinite value in censor column at row %d\n")
		    call pargi(j)
		    errstat = true
		}
	    }

	    # Get independent variable column
	    call calloc(scr, ntot, TY_DOUBLE)
	    do i=1,ncol {
		call tbcfnd(tp, varcol[1,i], tpvar[i], 1)
		if (tpvar[i] == NULL) {
		    call eprintf("Column %s not found(%s)\n")
		    call pargstr(varcol[1,i])
		    call pargstr(filename)
		    call tbtclo(tp)
		    call mfree(scr, TY_DOUBLE)
		    return (ERR)
		}
		call tbcgtd(tp, tpvar[i], Memd[scr], nullflag, 1, ntot)
		do j=1,ntot {
		    x[i,j] = Memd[scr+j-1]
		    if (nullflag[j]) {
			call eprintf(" Indefinite value in indvar column %s at row %d\n")
			call pargstr(varcol[1,i])
			call pargi(j)
			errstat = true
		    }
		}
		call aclrd(Memd[scr], ntot)
	    }
	    call mfree(scr, TY_DOUBLE)

	    # Get dependent variable column
	    call tbcfnd(tp, depcol, tpdep, 1)
	    if (tpdep == NULL) {
		call eprintf("Column %s not found(%s)\n")
		call pargstr(depcol)
		call pargstr(filename)
		call tbtclo(tp)
		return (ERR)
	    }
	    call tbcgtd(tp, tpdep, y, nullflag, 1, ntot)
	    do j = 1,ntot {
		if (nullflag[j]) {
		    call eprintf(" Indefinite value in depvar column at row %d\n")
		    call pargi(j)
		    errstat = true
		}
	    }

	    # Close the table
	    call tbtclo(tp)

	}

	# Check if any INDEF's were supplied
	if (errstat)
	    call error(0, " Indefinite values (INDEF) are not allowed")

	# Print some summary information for this data
	call printf (" Title:  %s \n")
	call pargstr (title)
	call printf ("\n")
	call printf (" Data:  %s \n")
	call pargstr (filename)
	if (not_table) {
	    call printf (" Columns used: Censor Indicator:%5d\n")
	    call pargi (cvar)
	    call printf ("        Independent Variable(s):%5d\n")
	    call pargi (ivar[1])
	    do i = 2,nvar {
		call printf ("%33t%5d\n")
		call pargi (ivar[i])
	    }
	    call printf ("             Dependent Variable:%5d\n")
	    call pargi (dvar)
	} else {
	    call printf (" Columns used: Censor Indicator:  %s\n")
	    call pargstr (cencol)
	    call printf ("        Independent Variable(s):  %s\n")
	    call pargstr (varcol[1,1])
	    do i = 2,nvar {
		call printf ("%33t  %s\n")
		call pargstr (varcol[1,i])
	    }
	    call printf ("             Dependent Variable:  %s\n")
	    call pargstr (depcol)
	}
	call printf ("\n")
	call printf (" Number of data points is %d\n")
	call pargi (ntot)
	call printf ("\n")

	return (OK)

end
