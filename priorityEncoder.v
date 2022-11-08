module priorityEncoder(SW, LEDR, LEDG, I);
input [8:0]SW;
output [2:0]LEDG;
output [8:0]LEDR;
output reg [2:0]I;

//variable
wire E;
wire [7:0]H;

//input
assign H = SW[7:0];
assign E = SW[8];
assign LEDR = {E,H};


//output
assign LEDG = I;

always @(H,E,I)

	if(E)
	
		casex(H)
		
		8'b 1xxxxxxx : I = 7;
		8'b 01xxxxxx : I = 6;
		8'b 001xxxxx : I = 5;
		8'b 0001xxxx : I = 4;
		8'b 00001xxx : I = 3;
		8'b 000001xx : I = 2;
		8'b 0000001x : I = 1;
		8'b 00000001 : I = 0;
		
endcase
endmodule