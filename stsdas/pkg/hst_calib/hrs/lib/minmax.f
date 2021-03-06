        SUBROUTINE MINMAX(A,N,AMIN,MINPOS,AMAX,MAXPOS)
*
*  Module number: FOS/HRS UTILITY
*
*  Module name: MINMAX
*
*  Keyphrase:
*  ----------
*       find minimum and maximum
*  Description:
*  ------------
*       This routine finds the minimum and maximum and their
*       positions in an integer vector
*
*  FORTRAN name: minmax.for
*
*  Keywords of accessed files and tables:
*  --------------------------------------
*  none
*
*  Subroutines Called:
*  -------------------
*       none
*
*  History:
*  --------
*  Version      Date        Author          Description
*    1          Oct. 87   D. Lindler    Designed and coded
*-------------------------------------------------------------------------------
C
C INPUT PARAMETERS
C
C       A - INTEGER VECTOR
C       N - NUMBER OF POINTS IN A (INTEGER)
C
C OUTPUT PARAMETERS
C
C       AMIN - MINIMUM VALUE OF A (INTEGER)
C       MINPOS - POSITION OF MINIMUM (INTEGER)
C       AMAX - MAXIMUM VALUE OF A (INTEGER)
C       MAXPOS - POSITION OF MAXIMUM (INTEGER)
C
C----------------------------------------------------------------------------
        INTEGER N,MINPOS,MAXPOS
        INTEGER A(N),AMIN,AMAX
C
C LOCAL VARIABLES
C
        INTEGER I
C
C SET MIN AND MAX TO FIRST ELEMENT
C
        MINPOS=1
        MAXPOS=1
        AMIN=A(1)
        AMAX=A(1)
C
C LOOP ON ELEMENTS
C
        DO 10 I=1,N
                IF(A(I).LT.AMIN)THEN
                        AMIN=A(I)
                        MINPOS=I
                ENDIF
                IF(A(I).GT.AMAX)THEN
                        AMAX=A(I)
                        MAXPOS=I
                ENDIF
10      CONTINUE
        RETURN
        END
