        SUBROUTINE ZXCCR6(GRAT,ID,CARPOS,ROWS,NFOUND,ISTAT)
*
*  Module number:
*
*  Module name: ZXCCR6
*
*  Keyphrase:
*  ----------
*       Index table CCR6 (GHRS dispersion coefficients)
*
*  Description:
*  ------------
*       This routine reads table CCR6 and extracts the carrousel positions
*       and there row numbers for the specified grating.
*       A sorted list of carrousel positions and row index is returned.
*  FORTRAN name: ZXCCR6.FOR
*
*  Keywords of accessed files and tables:
*  --------------------------------------
*  Name                         I/O     Description / Comments
*       CCR6                    I       Dispersion coef. table
*
*  Subroutines Called:
*  -------------------
*  SDAS:
*       ZMSPUT, uttopn, utpgti, utcfnd, utrgt*, uttclo
*
*  History:
*  --------
*  Version      Date        Author          Description
*       1       APR 89  D. Lindler      Designed and coded
*	1.1	Sep 91	S. Hulbert	Implemented dynamic memory allocation
*					for storing table
*-------------------------------------------------------------------------------
*
* Input parameters
*
*	GRAT - grating mode (character*3)
*       ID   - Table descriptor for CCR6.
*       CARPOS - pointer to vector of carrousel positions (sorted)
*       ROWS - pointer to row numbers for each y-deflection
*
* Output parameters
*
*       NFOUND - number of y-deflections found
*       istat - ERROR status (integer)
*
**************************************************************************
        INTEGER ISTAT,NFOUND,ROWS,ID,CARPOS
        CHARACTER*5 GRAT
C------------------------------------------------------------------------------
C Get IRAF MEM common into main program.
C
      LOGICAL          MEMB(1)
      INTEGER*2        MEMS(1)
      INTEGER*4        MEMI(1)
      INTEGER*4        MEML(1)
      REAL             MEMR(1)
      DOUBLE PRECISION MEMD(1)
      COMPLEX          MEMX(1)
      EQUIVALENCE (MEMB, MEMS, MEMI, MEML, MEMR, MEMD, MEMX)
      COMMON /MEM/ MEMD
C------------------------------------------------------------------------------
      INTEGER TYINT
      PARAMETER (TYINT=4)
      INTEGER TYREAL
      PARAMETER (TYREAL=6)
C
C     ZMSPUT DESTINATIONS -- CB, DAO, 4-SEP-87
C
      INTEGER STDOUT
      PARAMETER (STDOUT = 1)
      INTEGER STDERR
      PARAMETER (STDERR = 2)
C
C     THIS SECTION IS FOR PARAMETERS RELEVANT TO TABLE I/O.
C
C
C     THESE MAY BE READ BY UTPGTI BUT MAY NOT BE SET:
C
C                                       NUMBER OF ROWS WRITTEN TO
      INTEGER   TBNROW
      PARAMETER (TBNROW = 21)
C     END IRAF77.INC
C
C LOCAL VARIABLES -------------------------------------------
C
        INTEGER NROWS,COLIDS(2),ROW,N
	INTEGER ISTATS(2)
        CHARACTER*5 GMODE
        CHARACTER*80 CONTXT
        CHARACTER*15 COLNAM(2)
        LOGICAL NULL
        DATA COLNAM/'GRATING','CARPOS'/
C
C--------------------------------------------------------------------------
C
C get number of rows
C
        CALL UTPGTI(ID,TBNROW,NROWS,ISTAT)
        IF(ISTAT.NE.0)THEN
                CONTXT='ERROR reading CCR6 table'
                GO TO 999
        ENDIF
C
C Get column ids.
C
        CALL UTCFND(ID,COLNAM,2,COLIDS,ISTAT)
        IF(ISTAT.NE.0)THEN
                CONTXT='ERROR locating needed columns in CCR6 table'
                GO TO 999
        ENDIF
C
C Locate rows with correct grating mode
C Loop through twice, the first time is just to count the number of rows
C the second is to fill the newly allocated buffers
C
        NFOUND=0
        DO 20 ROW=1,NROWS
                CALL UTRGTT(ID,COLIDS(1),1,ROW,GMODE,NULL,ISTAT)
                IF(ISTAT.NE.0)THEN
                        CONTXT='ERROR reading CCR6 table'
                        GO TO 999
                ENDIF
                IF(GMODE.EQ.GRAT)NFOUND=NFOUND+1
20	CONTINUE
C
C Need at least 1 row of coefficients
C
        IF(NFOUND.EQ.0)THEN
                WRITE(CONTXT,199)GRAT
199             FORMAT('ERROR - No rows found in CCR6 for grating ',
     *                                A5)
                GO TO 999
        ENDIF
C
C allocate memory
C
        CALL UDMGET (NFOUND, TYINT, ROWS, ISTATS(1))
        CALL UDMGET (NFOUND, TYREAL, CARPOS, ISTATS(2))
        IF (ISTATS(1).NE.0.OR.ISTATS(2).NE.0) THEN
            CONTXT='ERROR allocating memory'
            GO TO 999
        ENDIF
C
C fill the buffers
C
        N=0
        DO 10 ROW=1,NROWS 
                CALL UTRGTT(ID,COLIDS(1),1,ROW,GMODE,NULL,ISTAT)
                IF(ISTAT.NE.0)THEN
                        CONTXT='ERROR reading CCR6 table '
                        GO TO 999
                ENDIF
                IF(GMODE.EQ.GRAT)THEN
			N=N+1
                        MEMI(ROWS+N-1)=ROW
                        CALL UTRGTR(ID,COLIDS(2),1,ROW,
     $				MEMR(CARPOS+N-1),NULL,ISTAT)
                        IF(ISTAT.NE.0)THEN
                            CONTXT='ERROR: reading CCR6 table '
                            GO TO 999
                        ENDIF
                ENDIF
10      CONTINUE
C
C sort into ascending order
C
        CALL ZSORTR(NFOUND,MEMR(CARPOS),MEMI(ROWS))
        ISTAT=0
        GO TO 1000
999     CALL ZMSPUT(CONTXT,STDOUT+STDERR,0,ISTAT)
        ISTAT=1
1000    RETURN
        END
