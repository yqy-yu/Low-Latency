module enc_round10(
input [127:0] round_in,
output [127:0] round_out
);

wire	[7:0]	sa00, sa01, sa02, sa03;
wire	[7:0]	sa10, sa11, sa12, sa13;
wire	[7:0]	sa20, sa21, sa22, sa23;
wire	[7:0]	sa30, sa31, sa32, sa33;

wire	[7:0]	sa00_sub, sa01_sub, sa02_sub, sa03_sub;
wire	[7:0]	sa10_sub, sa11_sub, sa12_sub, sa13_sub;
wire	[7:0]	sa20_sub, sa21_sub, sa22_sub, sa23_sub;
wire	[7:0]	sa30_sub, sa31_sub, sa32_sub, sa33_sub;
wire	[7:0]	sa00_sr, sa01_sr, sa02_sr, sa03_sr;
wire	[7:0]	sa10_sr, sa11_sr, sa12_sr, sa13_sr;
wire	[7:0]	sa20_sr, sa21_sr, sa22_sr, sa23_sr;
wire	[7:0]	sa30_sr, sa31_sr, sa32_sr, sa33_sr;



assign	sa33 =   round_in[007:000];
assign	sa23 =   round_in[015:008];
assign	sa13 =   round_in[023:016];
assign	sa03 =   round_in[031:024];
assign	sa32 =   round_in[039:032];
assign	sa22 =   round_in[047:040];
assign	sa12 =   round_in[055:048];
assign	sa02 =   round_in[063:056];
assign	sa31 =   round_in[071:064];
assign	sa21 =   round_in[079:072];
assign	sa11 =   round_in[087:080];
assign	sa01 =   round_in[095:088];
assign	sa30 =   round_in[103:096];
assign	sa20 =   round_in[111:104];
assign	sa10 =   round_in[119:112];
assign	sa00 =   round_in[127:120];

assign  round_out = {sa00_sr, sa10_sr, sa20_sr, sa30_sr, sa01_sr, sa11_sr, sa21_sr, sa31_sr, sa02_sr, sa12_sr, sa22_sr, sa32_sr, sa03_sr, sa13_sr, sa23_sr, sa33_sr};
////////////////////////////////////////////////////////////////////
//
// Round Permutations
//
//SR
assign sa00_sr = sa00_sub;
assign sa01_sr = sa01_sub;
assign sa02_sr = sa02_sub;
assign sa03_sr = sa03_sub;
assign sa10_sr = sa11_sub;
assign sa11_sr = sa12_sub;
assign sa12_sr = sa13_sub;
assign sa13_sr = sa10_sub;
assign sa20_sr = sa22_sub;
assign sa21_sr = sa23_sub;
assign sa22_sr = sa20_sub;
assign sa23_sr = sa21_sub;
assign sa30_sr = sa33_sub;
assign sa31_sr = sa30_sub;
assign sa32_sr = sa31_sub;
assign sa33_sr = sa32_sub;




////////////////////////////////////////////////////////////////////
//
// Generic Functions
//

////////////////////////////////////////////////////////////////////
//
// Modules
//

aes_sbox us00(	.a(	sa00	), .d(	sa00_sub	));
aes_sbox us01(	.a(	sa01	), .d(	sa01_sub	));
aes_sbox us02(	.a(	sa02	), .d(	sa02_sub	));
aes_sbox us03(	.a(	sa03	), .d(	sa03_sub	));
aes_sbox us10(	.a(	sa10	), .d(	sa10_sub	));
aes_sbox us11(	.a(	sa11	), .d(	sa11_sub	));
aes_sbox us12(	.a(	sa12	), .d(	sa12_sub	));
aes_sbox us13(	.a(	sa13	), .d(	sa13_sub	));
aes_sbox us20(	.a(	sa20	), .d(	sa20_sub	));
aes_sbox us21(	.a(	sa21	), .d(	sa21_sub	));
aes_sbox us22(	.a(	sa22	), .d(	sa22_sub	));
aes_sbox us23(	.a(	sa23	), .d(	sa23_sub	));
aes_sbox us30(	.a(	sa30	), .d(	sa30_sub	));
aes_sbox us31(	.a(	sa31	), .d(	sa31_sub	));
aes_sbox us32(	.a(	sa32	), .d(	sa32_sub	));
aes_sbox us33(	.a(	sa33	), .d(	sa33_sub	));


endmodule