`timescale 1ns/1ps
module SUB( output reg [3:0] output_data, input [3:0] input_data);  

always @(input_data) begin
    case(input_data)
            4'hC: output_data = 4'h0;
            4'h5: output_data = 4'h1;
            4'h6: output_data= 4'h2;
            4'hB: output_data= 4'h3;
            4'h9: output_data= 4'h4;
            4'h0: output_data = 4'h5;
            4'hA: output_data = 4'h6;
            4'hD: output_data = 4'h7;
            4'h3: output_data = 4'h8;
            4'hE: output_data = 4'h9;
            4'hF: output_data = 4'hA;
            4'h8: output_data = 4'hB;
            4'h4: output_data = 4'hC;
            4'h7: output_data = 4'hD;
            4'h1: output_data = 4'hE;
            4'h2: output_data = 4'hF;
    endcase 
    
end
    
endmodule 
module PERM(output[63:0] output_data, input[63:0] input_data);

assign output_data[0]  = input_data[0];
assign output_data[1]  = input_data[16];
assign output_data[2]  = input_data[32];
assign output_data[3]  = input_data[48];
assign output_data[4]  = input_data[1];
assign output_data[5]  = input_data[17];
assign output_data[6]  = input_data[33];
assign output_data[7]  = input_data[49];
assign output_data[8]  = input_data[2];
assign output_data[9]  = input_data[18];
assign output_data[10] = input_data[34];
assign output_data[11] = input_data[50];
assign output_data[12] = input_data[3];
assign output_data[13] = input_data[19];
assign output_data[14] = input_data[35];
assign output_data[15] = input_data[51];
assign output_data[16] = input_data[4];
assign output_data[17] = input_data[20];
assign output_data[18] = input_data[36];
assign output_data[19] = input_data[52];
assign output_data[20] = input_data[5];
assign output_data[21] = input_data[21];
assign output_data[22] = input_data[37];
assign output_data[23] = input_data[53];
assign output_data[24] = input_data[6];
assign output_data[25] = input_data[22];
assign output_data[26] = input_data[38];
assign output_data[27] = input_data[54];
assign output_data[28] = input_data[7];
assign output_data[29] = input_data[23];
assign output_data[30] = input_data[39];
assign output_data[31] = input_data[55];
assign output_data[32] = input_data[8];
assign output_data[33] = input_data[24];
assign output_data[34] = input_data[40];
assign output_data[35] = input_data[56];
assign output_data[36] = input_data[9];
assign output_data[37] = input_data[25];
assign output_data[38] = input_data[41];
assign output_data[39] = input_data[57];
assign output_data[40] = input_data[10];
assign output_data[41] = input_data[26];
assign output_data[42] = input_data[42];
assign output_data[43] = input_data[58];
assign output_data[44] = input_data[11];
assign output_data[45] = input_data[27];
assign output_data[46] = input_data[43];
assign output_data[47] = input_data[59];
assign output_data[48] = input_data[12];
assign output_data[49] = input_data[28];
assign output_data[50] = input_data[44];
assign output_data[51] = input_data[60];
assign output_data[52] = input_data[13];
assign output_data[53] = input_data[29];
assign output_data[54] = input_data[45];
assign output_data[55] = input_data[61];
assign output_data[56] = input_data[14];
assign output_data[57] = input_data[30];
assign output_data[58] = input_data[46];
assign output_data[59] = input_data[62];
assign output_data[60] = input_data[15];
assign output_data[61] = input_data[31];
assign output_data[62] = input_data[47];
assign output_data[63] = input_data[63];

endmodule
module decrypt(plaintext,key,reset,ciphertext,ready,clk);
input [63:0] ciphertext;
input [79:0] key;
input reset;
output [63:0] plaintext;
output reg ready;
input clk;

reg [63:0] data_register;
reg [79:0] masterkey;
reg[4:0] round;
wire [79:0] next_roundkey;
wire[63:0] permutation_data;
wire[63:0] substitution_data;


SUB s1(.output_data(substitution_data[3:0]),.input_data(permutation_data[3:0]));
SUB s2(.output_data(substitution_data[7:4]),.input_data(permutation_data[7:4]));
SUB s3(.output_data(substitution_data[11:8]),.input_data(permutation_data[11:8]));
SUB s4(.output_data(substitution_data[15:12]),.input_data(permutation_data[15:12]));
SUB s5(.output_data(substitution_data[19:16]),.input_data(permutation_data[19:16]));
SUB s6(.output_data(substitution_data[23:20]),.input_data(permutation_data[23:20]));
SUB s7(.output_data(substitution_data[27:24]),.input_data(permutation_data[27:24]));
SUB s8(.output_data(substitution_data[31:28]),.input_data(permutation_data[31:28]));
SUB s9(.output_data(substitution_data[35:32]),.input_data(permutation_data[35:32]));
SUB s10(.output_data(substitution_data[39:36]),.input_data(permutation_data[39:36]));
SUB s11(.output_data(substitution_data[43:40]),.input_data(permutation_data[43:40]));
SUB s12(.output_data(substitution_data[47:44]),.input_data(permutation_data[47:44]));
SUB s13(.output_data(substitution_data[51:48]),.input_data(permutation_data[51:48]));
SUB s14(.output_data(substitution_data[55:52]),.input_data(permutation_data[55:52]));
SUB s15(.output_data(substitution_data[59:56]),.input_data(permutation_data[59:56]));
SUB s16(.output_data(substitution_data[63:60]),.input_data(permutation_data[63:60]));
PERM p1(.output_data(permutation_data),.input_data(plaintext));
SUB key_substitution(.output_data(next_roundkey[18:15]), .input_data(masterkey[79:76]));
assign next_roundkey[33:19] = masterkey[14:0];               
assign next_roundkey[38:34] = masterkey[19:15] ^ round;        
assign next_roundkey[79:39] = masterkey[60:20];
assign next_roundkey[14:0] = masterkey[75:61];
assign plaintext=data_register^masterkey[79:16];


always@(posedge clk)
begin
    if (reset)
    begin
        data_register<=ciphertext;
        masterkey<=key;
        ready<=1'b0;
        round<=31;

    end
    if(!reset && !ready)
    begin
        masterkey<=next_roundkey;
        data_register<=substitution_data;
        round=round-1;
        if (round==0)
        begin
            ready<=1;
        end

    end

end

    
endmodule
