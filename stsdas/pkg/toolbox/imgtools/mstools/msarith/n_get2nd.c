# include <string.h>
# include <numeric.h>
# include "msarith.h"

/*  N_GET2ND: Updates control structure with information derived from
    parsing the 2nd operand. This can have one of three forms:
  
            - Numeric constant with no error attached.
            - Numeric constant with error attached: xxx(yyy)
            - File name/list. 

   Any errors are classified as syntax errors and result in task exit.



   Revision history:
   ---------------
   01 Mar 96  -  Implementation (IB)

*/

void n_get2nd (char *argument, arithControl *control) {

	/* Local variables */
	char	*open_par; /* Pointer to opening parenthesis */
	char	str[30];
	int	i, n;

	/* Function declarations */
	int n_getDouble (char *, double *);

	/* First thing to do is to detect and locate a possible "(..)" 
	   construct. Begin by locating the opening parenthesis. */
	if ((open_par = strchr(argument, '(')) != NULL) {

	    /* Opening parenthesis was detected, but can't be in certain
	       places in the string. */
	    if ( (open_par == argument)                      ||
	         (open_par == (argument+strlen(argument)-1)) ||
	         (open_par == (argument+strlen(argument)-2)) ) 
	        syntax_err ("Wrongly placed opening parenthesis.");

	    /* Now closing parenthesis has to be at the end of argument */
	    if (*(argument+strlen(argument)-1) != ')') {
	        syntax_err ("Wrongly placed closing parenthesis.");
	    } else {
	        /* Both parenthesis agree with expected configuration;
	           place both value and error in control structure. */
	        n = open_par - argument;
	        for (i=0; i < n; i++)
	            str[i] = *(argument + i);
	        str[n] = '\0';
	        if (n_getDouble (str, &(control->num_operand.value)))
	            syntax_err ("Wrong constant value.");
	        if (n_getDouble (open_par+1, &(control->num_operand.error)))
	            syntax_err ("Wrong constant error.");
	        control->isFile = False;
	    }
	} else {

	    /* Didn't find opening parenthesis; must assume that 2nd
               operand is either a single constant with no error or
	       a file name/list. Attempt to translate to double, if do 
               not succeed, assume it's file name. */
	    if (n_getDouble (argument, &(control->num_operand.value))) {

	        /* Argument is stored in control structure even if it is
                   a file name list which needs further processing. This
                   will be taken care off by the caller. */
	        strcpy (control->infile2, argument);
	        control->isFile = True;

	    } else {
	        control->num_operand.error = 0.0;
	        control->isFile = False;
	    }
	}
}




/*  Translates a character string to double. Returns 1 if error.

    Notice that, because the way get_numeric works, if the string
    begins with a valid substring followed by garbage up to the NULL 
    terminator, the valid characters will be correctly translated and 
    the garbage ignored.

*/

int n_getDouble (char *parameter, double *result) {

	NumericResult	constant;

	get_numeric(parameter, strlen(parameter), &constant);

	switch (constant.type) {
	    case OPERAND_LONG:   
	        *result = (double)constant.data.l; 
	        break;
	    case OPERAND_DOUBLE: 
	        *result = constant.data.d;         
	        break;
	    default:
	        return (1);
	}
	return (0);
}
