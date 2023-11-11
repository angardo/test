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
  
  input  [3:0] ina,inb;
  input cin;
  output [3:0] sum;
  output cout;
  
  assign ina[3:0] = ui_in[3:0];
  assign inbp[3:0] = ui_in[7:4];
  
 
  always@(posedge clk) begin

    if(reset) uio_out = 8'd0;
    else uio_out = {3'd0,ina+inb};
    
  end

endmodule
