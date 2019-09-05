include <imhdr.h>
include <iraf77.h>

# UIGL2? -- get a data line from an apparently 2-d file

procedure uigl2l (im, linenum, buffer, istat)

pointer im           # pointer to the image header file
int linenum          # line number to get from image
long buffer[ARB]    # user's buffer to be filled by this routine
int istat            # return status code

pointer ip, imgl2l()

begin
	istat = ER_OK

	# call imio to read the data into an imio buffer area
	iferr (ip = imgl2l(im, linenum)) {
		istat = ER_IMREAD
		return
		}
	# load the user's array from imio buffer
	call amovl (Meml[ip], buffer, IM_LEN(im,1))

end