/*
 * Created by 
   ../bin/Linux-x86_64-O/oasysGui 19.2-p002 on Fri Nov  4 21:28:15 2022
 * (C) Mentor Graphics Corporation
 */
/* CheckSum: 3389919956 */

module datapath(B, A, p_0);
   input [31:0]B;
   input [31:0]A;
   output [32:0]p_0;

   AOI21_X1 i_0 (.A(n_74), .B1(n_100), .B2(n_96), .ZN(p_0[0]));
   XNOR2_X1 i_1 (.A(n_74), .B(n_0), .ZN(p_0[1]));
   OAI22_X1 i_2 (.A1(n_101), .A2(n_97), .B1(B[1]), .B2(A[1]), .ZN(n_0));
   XNOR2_X1 i_3 (.A(n_76), .B(n_72), .ZN(p_0[2]));
   XNOR2_X1 i_4 (.A(n_71), .B(n_69), .ZN(p_0[3]));
   XNOR2_X1 i_5 (.A(n_68), .B(n_66), .ZN(p_0[4]));
   XNOR2_X1 i_6 (.A(n_65), .B(n_63), .ZN(p_0[5]));
   XNOR2_X1 i_7 (.A(n_62), .B(n_60), .ZN(p_0[6]));
   XNOR2_X1 i_8 (.A(n_59), .B(n_57), .ZN(p_0[7]));
   XNOR2_X1 i_9 (.A(n_56), .B(n_54), .ZN(p_0[8]));
   XNOR2_X1 i_10 (.A(n_53), .B(n_51), .ZN(p_0[9]));
   XNOR2_X1 i_11 (.A(n_50), .B(n_48), .ZN(p_0[10]));
   XNOR2_X1 i_12 (.A(n_47), .B(n_45), .ZN(p_0[11]));
   XNOR2_X1 i_13 (.A(n_44), .B(n_42), .ZN(p_0[12]));
   XNOR2_X1 i_14 (.A(n_41), .B(n_39), .ZN(p_0[13]));
   XNOR2_X1 i_15 (.A(n_38), .B(n_36), .ZN(p_0[14]));
   XOR2_X1 i_16 (.A(n_35), .B(n_34), .Z(p_0[15]));
   XNOR2_X1 i_17 (.A(n_33), .B(n_1), .ZN(p_0[16]));
   OAI22_X1 i_18 (.A1(B[16]), .A2(A[16]), .B1(n_102), .B2(n_98), .ZN(n_1));
   XNOR2_X1 i_19 (.A(n_79), .B(n_31), .ZN(p_0[17]));
   XNOR2_X1 i_20 (.A(n_30), .B(n_28), .ZN(p_0[18]));
   XNOR2_X1 i_21 (.A(n_27), .B(n_25), .ZN(p_0[19]));
   XNOR2_X1 i_22 (.A(n_24), .B(n_22), .ZN(p_0[20]));
   XOR2_X1 i_23 (.A(n_21), .B(n_2), .Z(p_0[21]));
   OAI21_X1 i_24 (.A(n_81), .B1(B[21]), .B2(A[21]), .ZN(n_2));
   XNOR2_X1 i_25 (.A(n_83), .B(n_20), .ZN(p_0[22]));
   XOR2_X1 i_26 (.A(n_19), .B(n_3), .Z(p_0[23]));
   OAI21_X1 i_27 (.A(n_84), .B1(B[23]), .B2(A[23]), .ZN(n_3));
   XOR2_X1 i_28 (.A(n_85), .B(n_17), .Z(p_0[24]));
   XOR2_X1 i_29 (.A(n_16), .B(n_15), .Z(p_0[25]));
   XOR2_X1 i_30 (.A(n_14), .B(n_4), .Z(p_0[26]));
   OAI21_X1 i_31 (.A(n_88), .B1(B[26]), .B2(A[26]), .ZN(n_4));
   XNOR2_X1 i_32 (.A(n_90), .B(n_13), .ZN(p_0[27]));
   XOR2_X1 i_33 (.A(n_12), .B(n_5), .Z(p_0[28]));
   OAI21_X1 i_34 (.A(n_92), .B1(B[28]), .B2(A[28]), .ZN(n_5));
   XNOR2_X1 i_35 (.A(n_94), .B(n_11), .ZN(p_0[29]));
   XOR2_X1 i_36 (.A(n_10), .B(n_9), .Z(p_0[30]));
   XNOR2_X1 i_37 (.A(n_8), .B(n_6), .ZN(p_0[31]));
   OAI22_X1 i_38 (.A1(n_103), .A2(n_99), .B1(B[31]), .B2(A[31]), .ZN(n_6));
   AOI21_X1 i_39 (.A(n_7), .B1(n_103), .B2(n_99), .ZN(p_0[32]));
   AOI21_X1 i_40 (.A(n_8), .B1(B[31]), .B2(A[31]), .ZN(n_7));
   OAI21_X1 i_41 (.A(n_95), .B1(n_10), .B2(n_9), .ZN(n_8));
   OAI21_X1 i_42 (.A(n_95), .B1(B[30]), .B2(A[30]), .ZN(n_9));
   AOI22_X1 i_43 (.A1(B[29]), .A2(A[29]), .B1(n_93), .B2(n_11), .ZN(n_10));
   AOI21_X1 i_44 (.A(n_91), .B1(n_92), .B2(n_12), .ZN(n_11));
   AOI22_X1 i_45 (.A1(B[27]), .A2(A[27]), .B1(n_89), .B2(n_13), .ZN(n_12));
   AOI21_X1 i_46 (.A(n_87), .B1(n_88), .B2(n_14), .ZN(n_13));
   AOI22_X1 i_47 (.A1(B[25]), .A2(A[25]), .B1(n_16), .B2(n_15), .ZN(n_14));
   XOR2_X1 i_48 (.A(B[25]), .B(A[25]), .Z(n_15));
   OAI21_X1 i_49 (.A(n_86), .B1(n_85), .B2(n_17), .ZN(n_16));
   OAI21_X1 i_50 (.A(n_18), .B1(B[23]), .B2(A[23]), .ZN(n_17));
   NAND2_X1 i_51 (.A1(n_84), .A2(n_19), .ZN(n_18));
   AOI22_X1 i_52 (.A1(B[22]), .A2(A[22]), .B1(n_82), .B2(n_20), .ZN(n_19));
   AOI21_X1 i_53 (.A(n_80), .B1(n_81), .B2(n_21), .ZN(n_20));
   AOI22_X1 i_54 (.A1(B[20]), .A2(A[20]), .B1(n_23), .B2(n_22), .ZN(n_21));
   XOR2_X1 i_55 (.A(B[20]), .B(A[20]), .Z(n_22));
   INV_X1 i_56 (.A(n_24), .ZN(n_23));
   AOI22_X1 i_57 (.A1(B[19]), .A2(A[19]), .B1(n_26), .B2(n_25), .ZN(n_24));
   XOR2_X1 i_58 (.A(B[19]), .B(A[19]), .Z(n_25));
   INV_X1 i_59 (.A(n_27), .ZN(n_26));
   AOI22_X1 i_60 (.A1(B[18]), .A2(A[18]), .B1(n_29), .B2(n_28), .ZN(n_27));
   XOR2_X1 i_61 (.A(B[18]), .B(A[18]), .Z(n_28));
   INV_X1 i_62 (.A(n_30), .ZN(n_29));
   AOI22_X1 i_63 (.A1(B[17]), .A2(A[17]), .B1(n_78), .B2(n_31), .ZN(n_30));
   OAI21_X1 i_64 (.A(n_32), .B1(n_102), .B2(n_98), .ZN(n_31));
   OAI21_X1 i_65 (.A(n_33), .B1(B[16]), .B2(A[16]), .ZN(n_32));
   OAI21_X1 i_66 (.A(n_77), .B1(n_35), .B2(n_34), .ZN(n_33));
   OAI21_X1 i_67 (.A(n_77), .B1(B[15]), .B2(A[15]), .ZN(n_34));
   AOI22_X1 i_68 (.A1(B[14]), .A2(A[14]), .B1(n_37), .B2(n_36), .ZN(n_35));
   XOR2_X1 i_69 (.A(B[14]), .B(A[14]), .Z(n_36));
   INV_X1 i_70 (.A(n_38), .ZN(n_37));
   AOI22_X1 i_71 (.A1(B[13]), .A2(A[13]), .B1(n_40), .B2(n_39), .ZN(n_38));
   XOR2_X1 i_72 (.A(B[13]), .B(A[13]), .Z(n_39));
   INV_X1 i_73 (.A(n_41), .ZN(n_40));
   AOI22_X1 i_74 (.A1(B[12]), .A2(A[12]), .B1(n_43), .B2(n_42), .ZN(n_41));
   XOR2_X1 i_75 (.A(B[12]), .B(A[12]), .Z(n_42));
   INV_X1 i_76 (.A(n_44), .ZN(n_43));
   AOI22_X1 i_77 (.A1(B[11]), .A2(A[11]), .B1(n_46), .B2(n_45), .ZN(n_44));
   XOR2_X1 i_78 (.A(B[11]), .B(A[11]), .Z(n_45));
   INV_X1 i_79 (.A(n_47), .ZN(n_46));
   AOI22_X1 i_80 (.A1(B[10]), .A2(A[10]), .B1(n_49), .B2(n_48), .ZN(n_47));
   XOR2_X1 i_81 (.A(B[10]), .B(A[10]), .Z(n_48));
   INV_X1 i_82 (.A(n_50), .ZN(n_49));
   AOI22_X1 i_83 (.A1(B[9]), .A2(A[9]), .B1(n_52), .B2(n_51), .ZN(n_50));
   XOR2_X1 i_84 (.A(B[9]), .B(A[9]), .Z(n_51));
   INV_X1 i_85 (.A(n_53), .ZN(n_52));
   AOI22_X1 i_86 (.A1(B[8]), .A2(A[8]), .B1(n_55), .B2(n_54), .ZN(n_53));
   XOR2_X1 i_87 (.A(B[8]), .B(A[8]), .Z(n_54));
   INV_X1 i_88 (.A(n_56), .ZN(n_55));
   AOI22_X1 i_89 (.A1(B[7]), .A2(A[7]), .B1(n_58), .B2(n_57), .ZN(n_56));
   XOR2_X1 i_90 (.A(B[7]), .B(A[7]), .Z(n_57));
   INV_X1 i_91 (.A(n_59), .ZN(n_58));
   AOI22_X1 i_92 (.A1(B[6]), .A2(A[6]), .B1(n_61), .B2(n_60), .ZN(n_59));
   XOR2_X1 i_93 (.A(B[6]), .B(A[6]), .Z(n_60));
   INV_X1 i_94 (.A(n_62), .ZN(n_61));
   AOI22_X1 i_95 (.A1(B[5]), .A2(A[5]), .B1(n_64), .B2(n_63), .ZN(n_62));
   XOR2_X1 i_96 (.A(B[5]), .B(A[5]), .Z(n_63));
   INV_X1 i_97 (.A(n_65), .ZN(n_64));
   AOI22_X1 i_98 (.A1(B[4]), .A2(A[4]), .B1(n_67), .B2(n_66), .ZN(n_65));
   XOR2_X1 i_99 (.A(B[4]), .B(A[4]), .Z(n_66));
   INV_X1 i_100 (.A(n_68), .ZN(n_67));
   AOI22_X1 i_101 (.A1(B[3]), .A2(A[3]), .B1(n_70), .B2(n_69), .ZN(n_68));
   XOR2_X1 i_102 (.A(B[3]), .B(A[3]), .Z(n_69));
   INV_X1 i_103 (.A(n_71), .ZN(n_70));
   AOI22_X1 i_104 (.A1(B[2]), .A2(A[2]), .B1(n_75), .B2(n_72), .ZN(n_71));
   AOI21_X1 i_105 (.A(n_73), .B1(n_101), .B2(n_97), .ZN(n_72));
   AOI21_X1 i_106 (.A(n_74), .B1(B[1]), .B2(A[1]), .ZN(n_73));
   NOR2_X1 i_107 (.A1(n_100), .A2(n_96), .ZN(n_74));
   INV_X1 i_108 (.A(n_76), .ZN(n_75));
   XNOR2_X1 i_109 (.A(B[2]), .B(A[2]), .ZN(n_76));
   NAND2_X1 i_110 (.A1(B[15]), .A2(A[15]), .ZN(n_77));
   INV_X1 i_111 (.A(n_79), .ZN(n_78));
   XNOR2_X1 i_112 (.A(B[17]), .B(A[17]), .ZN(n_79));
   NOR2_X1 i_113 (.A1(B[21]), .A2(A[21]), .ZN(n_80));
   NAND2_X1 i_114 (.A1(B[21]), .A2(A[21]), .ZN(n_81));
   INV_X1 i_115 (.A(n_83), .ZN(n_82));
   XNOR2_X1 i_116 (.A(B[22]), .B(A[22]), .ZN(n_83));
   NAND2_X1 i_117 (.A1(B[23]), .A2(A[23]), .ZN(n_84));
   OAI21_X1 i_118 (.A(n_86), .B1(B[24]), .B2(A[24]), .ZN(n_85));
   NAND2_X1 i_119 (.A1(B[24]), .A2(A[24]), .ZN(n_86));
   NOR2_X1 i_120 (.A1(B[26]), .A2(A[26]), .ZN(n_87));
   NAND2_X1 i_121 (.A1(B[26]), .A2(A[26]), .ZN(n_88));
   INV_X1 i_122 (.A(n_90), .ZN(n_89));
   XNOR2_X1 i_123 (.A(B[27]), .B(A[27]), .ZN(n_90));
   NOR2_X1 i_124 (.A1(B[28]), .A2(A[28]), .ZN(n_91));
   NAND2_X1 i_125 (.A1(B[28]), .A2(A[28]), .ZN(n_92));
   INV_X1 i_126 (.A(n_94), .ZN(n_93));
   XNOR2_X1 i_127 (.A(B[29]), .B(A[29]), .ZN(n_94));
   NAND2_X1 i_128 (.A1(B[30]), .A2(A[30]), .ZN(n_95));
   INV_X1 i_129 (.A(A[0]), .ZN(n_96));
   INV_X1 i_130 (.A(A[1]), .ZN(n_97));
   INV_X1 i_131 (.A(A[16]), .ZN(n_98));
   INV_X1 i_132 (.A(A[31]), .ZN(n_99));
   INV_X1 i_133 (.A(B[0]), .ZN(n_100));
   INV_X1 i_134 (.A(B[1]), .ZN(n_101));
   INV_X1 i_135 (.A(B[16]), .ZN(n_102));
   INV_X1 i_136 (.A(B[31]), .ZN(n_103));
endmodule

module adderPlus(A, B, Sum, Carry, OF);
   input [31:0]A;
   input [31:0]B;
   output [31:0]Sum;
   output Carry;
   output OF;

   wire n_0_1_0;
   wire n_0_1_1;

   datapath i_0_0 (.B(B), .A(A), .p_0({Carry, Sum[31], Sum[30], Sum[29], Sum[28], 
      Sum[27], Sum[26], Sum[25], Sum[24], Sum[23], Sum[22], Sum[21], Sum[20], 
      Sum[19], Sum[18], Sum[17], Sum[16], Sum[15], Sum[14], Sum[13], Sum[12], 
      Sum[11], Sum[10], Sum[9], Sum[8], Sum[7], Sum[6], Sum[5], Sum[4], Sum[3], 
      Sum[2], Sum[1], Sum[0]}));
   XOR2_X1 i_0_1_0 (.A(A[31]), .B(B[31]), .Z(n_0_1_0));
   XNOR2_X1 i_0_1_1 (.A(Sum[31]), .B(A[31]), .ZN(n_0_1_1));
   NOR2_X1 i_0_1_2 (.A1(n_0_1_0), .A2(n_0_1_1), .ZN(OF));
endmodule
