# include <stdio.h>
# include <string.h>
# include "readnoise.h"

/*   RN_IMMAP  -  Assemble the proper file name to access either the science 
 *                HDU or primary header with a c_immap call; test for its 
 *                presence and either c_immap it or return a NULL pointer.
 *
 *
 *
 *   Revision history:
 *   ----------------
 *   31 Oct 96  -  Implementation (IB)
 *
 */

IRAFPointer rn_immap (Image *image, char *filename, Bool science) {

	char          fullname[SZ_NAME];
	IRAFPointer   im;

	void rn_buildNames (Image *, char *, Bool, char *);

	rn_buildNames (image, filename, science, fullname);

	if (strlen (fullname) > 0) {
	    if (c_ximaccess (fullname, IRAF_READ_ONLY)) {
	        im = c_immap (fullname, IRAF_READ_ONLY, (IRAFPointer)0);
	        if (c_iraferr()) {
	            rn_IRAFerror();
	            return ((IRAFPointer)NULL);
	        } else 
	            return (im);
	    } else
	        return ((IRAFPointer)NULL);
	} else 
	    return ((IRAFPointer)NULL);
}
