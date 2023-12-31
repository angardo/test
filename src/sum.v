`default_nettype none

module tt_um_sumador (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  wire [3:0] ina,inb;
  reg [7:0] sum;
  
  // Numeros de entrada
  assign ina[3:0] = ui_in[3:0];
  assign inb[3:0] = ui_in[7:4];
  assign uo_out = sum;


    assign uio_out = 8'd255;
    assign uio_oe = 8'd255;
     
  always@(posedge clk) begin

    if(!rst_n) sum = 8'd0;
    else sum = {3'd0,ina+inb};
    
  end

endmodule
