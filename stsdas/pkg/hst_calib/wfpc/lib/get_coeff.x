#  get_coeff -- Read the Legendre polynomials for the specified chip
#
#  Description:
#  ------------
#  
#  Date		Author			Description
#  ----		------			-----------
#  15-Oct-1992  J.-C. Hsu		coding
#------------------------------------------------------------------------------
procedure get_coeff (ax, ay, iccd, order)

real	ax[*]
real	ay[*]
int	iccd
int	order

char	text[SZ_LINE]
#==============================================================================
begin
	if (iccd >= 1 && iccd <= 4) 
	    order = 6
	else if (iccd >= 5 && iccd <= 8) 
	    order = 3
	else {
	    call sprintf (text, SZ_LINE, "unreasonable detector number %d")
		call pargi (iccd)
	    call error (1, text)
	}

        # From file fitwf1o6d                               
        if (iccd == 1) {
            ax[  1] = -0.2336444E-01
            ax[  2] =  0.5275325    
            ax[  3] =  0.1606437    
            ax[  4] =  0.9010845    
            ax[  5] = -0.2160109E-01
            ax[  6] = -0.1409633E-01
            ax[  7] = -0.1423608E-01
            ax[  8] =  0.5583573E-02
            ax[  9] =  0.1396959    
            ax[ 10] = -0.1945610E-01
            ax[ 11] = -0.1112910    
            ax[ 12] =  0.5036587E-01
            ax[ 13] =  0.4384667E-05
            ax[ 14] =  0.1941875E-01
            ax[ 15] = -0.2630319E-01
            ax[ 16] =   1.482649    
            ax[ 17] = -0.7600397E-01
            ax[ 18] =  0.3254256E-01
            ax[ 19] = -0.7798251E-01
            ax[ 20] =  0.7256232E-03
            ax[ 21] =  0.1009614E-01
            ax[ 22] =  0.1495925E-03
            ax[ 23] = -0.1709760    
            ax[ 24] =  0.6029796E-02
            ax[ 25] = -0.1236130    
            ax[ 26] =  0.8752199E-01
            ax[ 27] = -0.1152541    
            ax[ 28] =  0.1951145    
            ax[ 29] = -0.6819908E-01
            ax[ 30] =  0.7236644E-01
            ax[ 31] = -0.4148955E-01
            ax[ 32] = -0.1619666E-01
            ax[ 33] =  0.7333618E-01
            ax[ 34] = -0.9825061E-01
            ax[ 35] = -0.1567226    
            ax[ 36] = -0.1651637E-01
            ax[ 37] = -0.2206500    
            ax[ 38] = -0.2672628E-01
            ax[ 39] = -0.9180682E-01
            ax[ 40] = -0.6470433E-02
            ax[ 41] =  0.2183408    
            ax[ 42] =  0.4901531E-01
            ax[ 43] =  0.4489209E-01
            ax[ 44] =  0.3283064E-01
            ax[ 45] = -0.7355499E-01
            ax[ 46] =  0.6748101E-01
            ax[ 47] = -0.2414445    
            ax[ 48] =  0.6883167E-02
            ax[ 49] = -0.6814478E-01
            ay[  1] = -0.2294609E-02
            ay[  2] = -0.2418543E-01
            ay[  3] = -0.3926396E-01
            ay[  4] = -0.2352273E-01
            ay[  5] = -0.6428252E-02
            ay[  6] = -0.8403104E-02
            ay[  7] =  0.2916741E-01
            ay[  8] =  0.5483348    
            ay[  9] =  0.3876618    
            ay[ 10] =   1.418941    
            ay[ 11] = -0.1050853    
            ay[ 12] =  0.4409370E-02
            ay[ 13] =  0.8432860E-01
            ay[ 14] = -0.4974105E-02
            ay[ 15] =  0.7007889E-01
            ay[ 16] = -0.5289730E-01
            ay[ 17] =  0.7010028E-01
            ay[ 18] = -0.1549250    
            ay[ 19] = -0.2642935E-01
            ay[ 20] = -0.8464496E-01
            ay[ 21] =  0.1525889    
            ay[ 22] =  0.8771110    
            ay[ 23] = -0.1323272    
            ay[ 24] = -0.1061602    
            ay[ 25] =  0.1966991    
            ay[ 26] = -0.1216491    
            ay[ 27] = -0.1738554E-01
            ay[ 28] =  0.1994210E-01
            ay[ 29] = -0.1222223E-02
            ay[ 30] = -0.6611737E-02
            ay[ 31] = -0.3253028E-02
            ay[ 32] = -0.2692477    
            ay[ 33] =  0.6145699E-01
            ay[ 34] = -0.7585385E-01
            ay[ 35] =  0.1639765    
            ay[ 36] =  0.2820922E-01
            ay[ 37] = -0.2022830    
            ay[ 38] =  0.2220399E-01
            ay[ 39] =  0.5315905E-01
            ay[ 40] = -0.1273886    
            ay[ 41] =  0.2985706    
            ay[ 42] =  0.3799296E-01
            ay[ 43] = -0.1826984E-01
            ay[ 44] =  0.3323072E-02
            ay[ 45] = -0.1234858    
            ay[ 46] = -0.4271964E-01
            ay[ 47] =  0.2775584    
            ay[ 48] = -0.1044490    
            ay[ 49] = -0.1522094    
        }

        # From file fitwf2o6d                               
        if (iccd == 2) {
            ax[  1] =  0.5503193E-02
            ax[  2] =  0.4321346    
            ax[  3] =  0.1058802    
            ax[  4] =  0.9057879    
            ax[  5] =  0.9491311E-02
            ax[  6] =  0.2742684E-01
            ax[  7] =  0.2658338E-01
            ax[  8] = -0.9366396E-01
            ax[  9] =  0.2862231    
            ax[ 10] = -0.5958553E-01
            ax[ 11] =  0.6617124E-02
            ax[ 12] =  0.4040422E-01
            ax[ 13] =  0.5965728E-02
            ax[ 14] =  0.1371547    
            ax[ 15] = -0.7155089E-01
            ax[ 16] =   1.585082    
            ax[ 17] =  0.4831539E-02
            ax[ 18] = -0.1717277    
            ax[ 19] =  0.5487266E-01
            ax[ 20] =  0.1291938    
            ax[ 21] = -0.1193317    
            ax[ 22] = -0.3116379E-01
            ax[ 23] = -0.1892111E-01
            ax[ 24] =  0.5120642E-01
            ax[ 25] =  0.1664207    
            ax[ 26] =  0.1467180    
            ax[ 27] =  0.3807567E-01
            ax[ 28] = -0.3493750E-02
            ax[ 29] =  0.2266664E-01
            ax[ 30] = -0.6906918E-01
            ax[ 31] =  0.1044471    
            ax[ 32] =  0.1285825    
            ax[ 33] =  0.8612575E-01
            ax[ 34] =  0.8435168E-01
            ax[ 35] = -0.1438587    
            ax[ 36] =  0.3423406E-01
            ax[ 37] =  0.1828302    
            ax[ 38] =  0.9817161E-01
            ax[ 39] =  0.7369102E-01
            ax[ 40] =  0.5926152E-01
            ax[ 41] = -0.3519440    
            ax[ 42] = -0.1416856    
            ax[ 43] =  0.4780254E-02
            ax[ 44] =  0.1857819E-01
            ax[ 45] = -0.3631860E-01
            ax[ 46] =  0.1226743E-02
            ax[ 47] = -0.2218897    
            ax[ 48] =  0.3446321    
            ax[ 49] =  0.2295620    
            ay[  1] =  0.1765822E-01
            ay[  2] = -0.1286836    
            ay[  3] = -0.1835659E-01
            ay[  4] = -0.2337281E-01
            ay[  5] =  0.1748340E-01
            ay[  6] =  0.1025500    
            ay[  7] =  0.4845447E-01
            ay[  8] =  0.5985988    
            ay[  9] =  0.2771027    
            ay[ 10] =   1.631742    
            ay[ 11] =  0.1481662E-01
            ay[ 12] = -0.6344292E-01
            ay[ 13] =  0.8333091E-01
            ay[ 14] =  0.5782462E-01
            ay[ 15] =  0.1429158    
            ay[ 16] =  0.1897549E-01
            ay[ 17] =  0.3327247E-01
            ay[ 18] =  0.8832614E-01
            ay[ 19] =  0.4211031E-01
            ay[ 20] =  0.1816123    
            ay[ 21] = -0.1069946E-01
            ay[ 22] =  0.9372543    
            ay[ 23] = -0.1836339E-01
            ay[ 24] = -0.1301789    
            ay[ 25] =  0.8094922E-01
            ay[ 26] =  0.8795680E-01
            ay[ 27] = -0.4335056E-01
            ay[ 28] =  0.1455502    
            ay[ 29] =  0.6656898E-01
            ay[ 30] =  0.8975474E-01
            ay[ 31] =  0.2089422E-01
            ay[ 32] =  0.2453108    
            ay[ 33] = -0.7540564E-01
            ay[ 34] = -0.9398216E-01
            ay[ 35] = -0.1247321    
            ay[ 36] = -0.5082827E-01
            ay[ 37] =  0.4549693E-01
            ay[ 38] =  0.1455799E-01
            ay[ 39] =  0.2176695E-02
            ay[ 40] = -0.9990510E-02
            ay[ 41] =  0.1547022E-01
            ay[ 42] =  0.2508101    
            ay[ 43] =  0.1029833E-01
            ay[ 44] =  0.7788739E-01
            ay[ 45] =  0.2857232E-01
            ay[ 46] =  0.5164505E-01
            ay[ 47] = -0.2264093E-01
            ay[ 48] =  0.2530333    
            ay[ 49] = -0.2497012    
        }

        # From file fitwf3o6d                               
        if (iccd == 3) {
            ax[  1] = -0.2642658E-01
            ax[  2] =  0.3368796    
            ax[  3] =  0.1043881    
            ax[  4] =  0.8128909    
            ax[  5] =  0.5991604E-01
            ax[  6] =  0.6880578E-01
            ax[  7] = -0.9708448E-01
            ax[  8] = -0.2614486E-01
            ax[  9] =  0.2928774    
            ax[ 10] =  0.3070183E-01
            ax[ 11] = -0.3538389E-01
            ax[ 12] =  0.8335658E-02
            ax[ 13] = -0.5235756E-01
            ax[ 14] =  0.7556549E-02
            ax[ 15] = -0.4233501E-01
            ax[ 16] =   1.430969    
            ax[ 17] =  0.7413117E-02
            ax[ 18] =  0.2988798E-01
            ax[ 19] = -0.1296467    
            ax[ 20] = -0.1599380E-01
            ax[ 21] =  0.1438016E-01
            ax[ 22] = -0.1610402E-01
            ax[ 23] = -0.3509874E-01
            ax[ 24] = -0.1324476E-01
            ax[ 25] =  0.1361415E-01
            ax[ 26] =  0.3804489E-01
            ax[ 27] =  0.1221896E-01
            ax[ 28] = -0.1988625E-01
            ax[ 29] = -0.4620745E-01
            ax[ 30] =  0.3921518E-01
            ax[ 31] = -0.7948179E-01
            ax[ 32] = -0.8884429E-01
            ax[ 33] =  0.3485932E-01
            ax[ 34] =  0.1771249E-02
            ax[ 35] =  0.1568214    
            ax[ 36] =  0.4028407E-02
            ax[ 37] = -0.2329232E-01
            ax[ 38] = -0.4145630E-01
            ax[ 39] = -0.7779127E-01
            ax[ 40] = -0.8745147E-01
            ax[ 41] =  0.1291846    
            ax[ 42] =  0.1577183    
            ax[ 43] =  0.1526594E-01
            ax[ 44] =  0.2597743E-01
            ax[ 45] =  0.8085000E-01
            ax[ 46] =  0.3359880E-01
            ax[ 47] =  0.2071646    
            ax[ 48] = -0.9960490E-01
            ax[ 49] = -0.2644148    
            ay[  1] = -0.2952935E-03
            ay[  2] = -0.3471795E-01
            ay[  3] = -0.3698941E-01
            ay[  4] = -0.2493040E-01
            ay[  5] = -0.5935399E-02
            ay[  6] =  0.9930491E-02
            ay[  7] =  0.2817418E-01
            ay[  8] =  0.3458644    
            ay[  9] =  0.1692658    
            ay[ 10] =   1.442048    
            ay[ 11] =  0.4987379E-01
            ay[ 12] =  0.5682379E-01
            ay[ 13] = -0.1800309    
            ay[ 14] = -0.2468004E-01
            ay[ 15] =  0.2038113    
            ay[ 16] = -0.1331707E-01
            ay[ 17] = -0.6348889E-01
            ay[ 18] = -0.5931171E-02
            ay[ 19] =  0.4203479E-02
            ay[ 20] = -0.4027355E-01
            ay[ 21] =  0.4349283E-01
            ay[ 22] =  0.7649735    
            ay[ 23] =  0.4605699E-01
            ay[ 24] =  0.5869224E-01
            ay[ 25] = -0.8519316E-01
            ay[ 26] = -0.3962924E-01
            ay[ 27] =  0.1641583    
            ay[ 28] = -0.5697048E-01
            ay[ 29] =  0.5022680E-01
            ay[ 30] =  0.5883782E-01
            ay[ 31] = -0.1725131E-01
            ay[ 32] = -0.3365676E-02
            ay[ 33] =  0.1028012    
            ay[ 34] = -0.8140541E-01
            ay[ 35] =  0.1929491E-01
            ay[ 36] =  0.6648445E-02
            ay[ 37] = -0.2585402E-01
            ay[ 38] = -0.3237193E-01
            ay[ 39] =  0.3481092E-02
            ay[ 40] = -0.5560883E-01
            ay[ 41] =  0.1775949    
            ay[ 42] = -0.2770525E-01
            ay[ 43] = -0.6373794E-01
            ay[ 44] =  0.4964329E-01
            ay[ 45] = -0.2750703E-01
            ay[ 46] = -0.9043215E-02
            ay[ 47] =  0.2885308E-01
            ay[ 48] = -0.1335256    
            ay[ 49] = -0.2412949E-01
        }

        # From file fitwf4o6d                               
        if (iccd == 4) {
            ax[  1] = -0.2012274E-01
            ax[  2] =  0.4221249    
            ax[  3] = -0.7879261E-02
            ax[  4] =  0.7122383    
            ax[  5] =  0.6544867E-01
            ax[  6] = -0.1050021    
            ax[  7] = -0.1364748E-01
            ax[  8] =  0.5230194E-01
            ax[  9] =  0.4591399    
            ax[ 10] =  0.1484134E-01
            ax[ 11] = -0.7250543E-01
            ax[ 12] = -0.1049917    
            ax[ 13] =  0.1402888    
            ax[ 14] = -0.1914405    
            ax[ 15] = -0.9279302E-01
            ax[ 16] =   1.383384    
            ax[ 17] = -0.9210044E-02
            ax[ 18] =  0.6694451E-01
            ax[ 19] =  0.1281594E-01
            ax[ 20] =  0.5300969E-01
            ax[ 21] =  0.8698547E-01
            ax[ 22] = -0.1267874E-01
            ax[ 23] =  0.1803968E-01
            ax[ 24] = -0.1661837    
            ax[ 25] =  0.2529776E-01
            ax[ 26] =  0.1464182E-01
            ax[ 27] =  0.4117923E-01
            ax[ 28] = -0.7606050E-01
            ax[ 29] = -0.2565216E-02
            ax[ 30] =  0.7959796E-02
            ax[ 31] =  0.4531945E-01
            ax[ 32] = -0.7424881E-01
            ax[ 33] =  0.6099837E-01
            ax[ 34] = -0.4034994E-01
            ax[ 35] =  0.3425971E-01
            ax[ 36] =  0.8113652E-02
            ax[ 37] = -0.1758222E-01
            ax[ 38] = -0.6595917E-01
            ax[ 39] = -0.7696686E-01
            ax[ 40] = -0.2955736    
            ax[ 41] = -0.2385576E-01
            ax[ 42] =  0.4981071    
            ax[ 43] =  0.9152859E-01
            ax[ 44] =  0.2395216E-01
            ax[ 45] = -0.9847205E-02
            ax[ 46] =  0.5602424E-01
            ax[ 47] = -0.1930105    
            ax[ 48] = -0.3930265E-01
            ax[ 49] =  0.1075390    
            ay[  1] =  0.6910571E-01
            ay[  2] =  0.1560867    
            ay[  3] =  0.1955154E-01
            ay[  4] = -0.5265929E-02
            ay[  5] =  0.8395614E-02
            ay[  6] = -0.1327087    
            ay[  7] =  0.1013323    
            ay[  8] =  0.5217003    
            ay[  9] =  0.6175965E-02
            ay[ 10] =   1.443655    
            ay[ 11] =  0.5312537E-01
            ay[ 12] = -0.1553086    
            ay[ 13] =  0.1309974    
            ay[ 14] =  0.5070347E-02
            ay[ 15] =  0.3095202    
            ay[ 16] = -0.1069606    
            ay[ 17] =  0.1546502    
            ay[ 18] = -0.2050952    
            ay[ 19] =  0.2260453    
            ay[ 20] = -0.2806915    
            ay[ 21] =  0.2251496    
            ay[ 22] =  0.8112516    
            ay[ 23] =  0.3647617E-01
            ay[ 24] = -0.8148051E-01
            ay[ 25] =  0.1357066    
            ay[ 26] = -0.7293693E-01
            ay[ 27] =  0.1388287    
            ay[ 28] = -0.2229658    
            ay[ 29] =  0.5454848E-01
            ay[ 30] = -0.1747823    
            ay[ 31] =  0.1336487    
            ay[ 32] = -0.1405646    
            ay[ 33] =  0.3810327    
            ay[ 34] =  0.1415523    
            ay[ 35] = -0.6510639E-01
            ay[ 36] =  0.2784174E-01
            ay[ 37] =  0.1301928    
            ay[ 38] =  0.5474470E-01
            ay[ 39] =  0.2553560    
            ay[ 40] =  0.1236423E-01
            ay[ 41] = -0.5560084    
            ay[ 42] = -0.3992696    
            ay[ 43] = -0.1644468E-01
            ay[ 44] = -0.6353812E-01
            ay[ 45] =  0.3352667E-01
            ay[ 46] = -0.4713317E-01
            ay[ 47] = -0.8257119E-01
            ay[ 48] = -0.8344331E-01
            ay[ 49] =  0.2849222    
        }

        # From file fitpc53a                                
        if (iccd == 5) {
            ax[  1] =  0.2769871E-01
            ax[  2] =   1.802700    
            ax[  3] =  0.4728749E-01
            ax[  4] =  0.8393708    
            ax[  5] = -0.1948258E-01
            ax[  6] =  0.2052348    
            ax[  7] = -0.5383795E-01
            ax[  8] = -0.5851921E-01
            ax[  9] =  0.1021210    
            ax[ 10] =   1.574963    
            ax[ 11] =  0.9963103E-03
            ax[ 12] = -0.2029048E-01
            ax[ 13] =  0.3591013E-01
            ax[ 14] = -0.2630575E-01
            ax[ 15] =  0.5156884E-01
            ax[ 16] =  0.5567169E-01
            ay[  1] =  0.8879611E-01
            ay[  2] = -0.2580175    
            ay[  3] =  0.1870322E-01
            ay[  4] = -0.4325809E-02
            ay[  5] =   1.685109    
            ay[  6] =  0.1696560    
            ay[  7] =   1.488791    
            ay[  8] =  0.1669610    
            ay[  9] =  0.2127367    
            ay[ 10] = -0.5521635E-01
            ay[ 11] = -0.1143693    
            ay[ 12] =  0.3798051E-01
            ay[ 13] =  0.9698709    
            ay[ 14] =  0.4264705E-02
            ay[ 15] = -0.2750330E-01
            ay[ 16] = -0.2280365E-01
        }

        # From file fitpc63a                                
        if (iccd == 6) {
            ax[  1] =  0.8265831E-01
            ax[  2] =   1.563284    
            ax[  3] =  0.1121787    
            ax[  4] =  0.9317749    
            ax[  5] =  0.1498687    
            ax[  6] =  0.7838241E-01
            ax[  7] =  0.1559611    
            ax[  8] = -0.4747867E-01
            ax[  9] =  0.1956489E-01
            ax[ 10] =   1.395219    
            ax[ 11] = -0.7854018E-01
            ax[ 12] =  0.1557606    
            ax[ 13] =  0.7366973E-01
            ax[ 14] = -0.1873391E-01
            ax[ 15] = -0.1495831E-01
            ax[ 16] = -0.6441912E-01
            ay[  1] = -0.1929006E-01
            ay[  2] =  0.9546778E-01
            ay[  3] =  0.2606492E-01
            ay[  4] =  0.7132681E-01
            ay[  5] =   1.648219    
            ay[  6] =  0.1860316    
            ay[  7] =   1.298824    
            ay[  8] = -0.1043276    
            ay[  9] =  0.5009159E-01
            ay[ 10] =  0.1394034    
            ay[ 11] =  0.6406074E-01
            ay[ 12] = -0.2825174E-01
            ay[ 13] =  0.9297564    
            ay[ 14] = -0.1611679    
            ay[ 15] = -0.2242097E-01
            ay[ 16] =  0.4672030E-01
        }

        # From file fitpc71a                                
        if (iccd == 7) {
            ax[  1] =  0.1235081    
            ax[  2] =   1.633345    
            ax[  3] =  0.2624320    
            ax[  4] =  0.8099025    
            ax[  5] = -0.2381497E-01
            ax[  6] =  0.1702618    
            ax[  7] = -0.1191487    
            ax[  8] = -0.1585636    
            ax[  9] = -0.2169114E-01
            ax[ 10] =   1.313276    
            ax[ 11] = -0.7337985E-01
            ax[ 12] = -0.7258227E-01
            ax[ 13] = -0.2273184E-01
            ax[ 14] = -0.9934567E-01
            ax[ 15] = -0.6670006E-01
            ax[ 16] = -0.5238797E-01
            ay[  1] =  0.7169866E-01
            ay[  2] = -0.5772896E-01
            ay[  3] =  0.8385244E-01
            ay[  4] = -0.4187708E-01
            ay[  5] =   1.692568    
            ay[  6] =  0.4322653    
            ay[  7] =   1.607742    
            ay[  8] =  0.1852711    
            ay[  9] =  0.9421606E-01
            ay[ 10] = -0.1274759    
            ay[ 11] = -0.6287923E-01
            ay[ 12] = -0.1319788    
            ay[ 13] =  0.8519538    
            ay[ 14] =  0.3500608E-01
            ay[ 15] =  0.4682639E-01
            ay[ 16] =  0.1841034    
        }

        # From file fitpc68c                                
        if (iccd == 8) {
            ax[  1] =  0.8267967E-01
            ax[  2] =  0.9635305    
            ax[  3] = -0.9859751E-01
            ax[  4] =  0.9631473    
            ax[  5] =  0.2582187    
            ax[  6] =  0.2463234    
            ax[  7] =  0.1142677    
            ax[  8] =  0.8905381E-03
            ax[  9] = -0.7057834E-01
            ax[ 10] =   1.525886    
            ax[ 11] =  0.1601184    
            ax[ 12] =  0.2014364E-01
            ax[ 13] = -0.1684447    
            ax[ 14] = -0.1410341    
            ax[ 15] = -0.3709684    
            ax[ 16] = -0.3398988    
            ay[  1] =  0.6186438E-01
            ay[  2] =  0.2056325    
            ay[  3] =  0.1814180E-01
            ay[  4] = -0.8576777E-01
            ay[  5] =  0.8821697    
            ay[  6] = -0.1832421    
            ay[  7] =   1.549616    
            ay[  8] =  0.3876205E-01
            ay[  9] =  0.1129479    
            ay[ 10] =  0.2334546    
            ay[ 11] = -0.1861043E-01
            ay[ 12] = -0.1491385    
            ay[ 13] =   1.022151    
            ay[ 14] =  0.4455078E-01
            ay[ 15] = -0.3874109E-01
            ay[ 16] = -0.2279947    
        }
end