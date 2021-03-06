include	"filetype.h"

# FILETYPE -- Determine the file type from the file name. Say the file type
# is unknown if the file cannot be accessed or the name is ambiguous.
#
# B.Simon	Aug-13-87	First Code

int procedure filetype (fname)

char	fname[ARB]	# i: file name
#--
int	ftype
pointer	sp, extension, cluster

int	fnextn(), imaccess(), tabaccess(), access()

begin
	call smark (sp)
	call salloc (cluster, SZ_FNAME, TY_CHAR)
	call salloc (extension, SZ_FNAME, TY_CHAR)

	ftype = UNKNOWN_FILE
	call imgcluster (fname, Memc[cluster], SZ_FNAME)

	if (access (Memc[cluster], 0, 0) == YES) {

	    # File exists with specified name

	    if (imaccess (Memc[cluster], READ_ONLY) == YES &&
		imaccess (Memc[cluster], NEW_FILE) == YES    )

		ftype = IMAGE_FILE

	    else if (tabaccess (Memc[cluster], READ_ONLY) == YES)

		ftype = TABLE_FILE

	    else if (access (Memc[cluster], READ_ONLY, TEXT_FILE) == YES)

		ftype = LIST_FILE

	} else if (fnextn (Memc[cluster], Memc[extension], SZ_FNAME) == 0) {

	    # File name does not contain an extension,
	    # try adding default extensions

	    if (tabaccess (Memc[cluster], READ_ONLY) == YES &&
		imaccess (Memc[cluster], READ_ONLY) == YES     )

		ftype = UNKNOWN_FILE

	    else if (imaccess (Memc[cluster], READ_ONLY) == YES)

		ftype = IMAGE_FILE

	    else if (tabaccess (Memc[cluster], READ_ONLY) == YES)

		ftype = TABLE_FILE

	    else if (access (Memc[cluster], READ_ONLY, TEXT_FILE) == YES)

		ftype = LIST_FILE

	}

	call sfree (sp)
	return (ftype)
end
