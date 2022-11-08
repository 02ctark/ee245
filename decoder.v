module decoder(SW, LEDR, LEDG);


input [3:0]SW;
output [3:0]LEDR;
output [7:0]LEDG;
reg [7:0] Y;

wire E;
wire [2:0] A;
//E enabler
assign E = SW[3];

//A input
assign A = SW[2:0];

assign LEDR = {E,A};

//Y output
assign LEDG = Y;



	always @(Y,E,A)
	
	if(E == 1)
		
		case(A)
		
		3'b000: Y = 8'b00000001;
		3'b001: Y = 8'b00000010;
		3'b010: Y = 8'b00000100;
		3'b011: Y = 8'b00001000;
		3'b100: Y = 8'b00010000;
		3'b101: Y = 8'b00100000;
		3'b110: Y = 8'b01000000;
		3'b111: Y = 8'b10000000;
		endcase
		
	else
		Y = 8'b00000000;

endmodule


//encoder O is A
module augEncoder(SW, LEDR, LEDG, A);

input [8:0]SW;
output [8:0]LEDR;
output [2:0]LEDG;
output reg [2:0]A;

wire E;
wire [7:0] Y;

//input
assign Y = SW[7:0];
assign E = SW[8];
assign LEDR = {E,Y};
//output
assign LEDG = A;

	always @(A,E,Y)

 	if(E == 1)
	
		case(Y)
		
		8'b00000000 : A = 3'b000;
		8'b00000010 : A = 3'b001;
		8'b00000100 : A = 3'b010;
		8'b00001000 : A = 3'b011;
		8'b00010000 : A = 3'b100;
		8'b00100000 : A = 3'b101;
		8'b01000000 : A = 3'b110;
		8'b10000000 : A = 3'b111;
		default : A = 3'b000;
		
		endcase
	
		
endmodule