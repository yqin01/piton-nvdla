//Created by Tigar Cyr and Chris Grimm
//Unused code as an existing axi2apb model was discovered under the Ariane Core files.

`define OKAY   2'b00
`define EXOKAY 2'b01
`define SLVERR 2'b10
`define DECERR 2'b11

module slave_aw_buffer_i #(
    parameter ADDRESS_WIDTH = 32,
    parameter ID_WIDTH      = 16,
    parameter USER_WIDTH    = 10,
    parameter BUFF_DEPTH   = 4
) (
   input wire                          clk_i,
   input wire                          rst_ni,
   input wire                          test_en_i,
   
   input wire                          slave_valid_i,
   input wire [(ADDRESS_WIDTH - 1):0]  slave_addr_i,
   input wire [2:0]                    slave_prot_i,
   input wire [3:0]                    slave_region_i,
   input wire [7:0]                    slave_len_i,
   input wire [2:0]                    slave_size_i,
   input wire [1:0]                    slave_burst_i,
   input wire                          slave_lock_i,
   input wire [3:0]                    slave_cache_i,
   input wire [3:0]                    slave_qos_i,
   input wire [(ID_WIDTH - 1):0]       slave_id_i,
   input wire [(USER_WIDTH - 1):0]     slave_user_i,
   output reg                          slave_ready_o,

   output reg		               master_valid_o,
   output reg [(ADDRESS_WIDTH - 1):0]  master_addr_o,
   output reg [2:0]		       master_prot_o,
   output reg [3:0]		       master_region_o,
   output reg [7:0]		       master_len_o,
   output reg [2:0]		       master_size_o,
   output reg [1:0]		       master_burst_o,
   output reg                          master_lock_o,
   output reg [3:0]		       master_cache_o,
   output reg [3:0] 		       master_qos_o,
   output reg [(ID_WIDTH - 1):0]       master_id_o,
   output reg [(USER_WIDTH - 1):0]     master_user_o,
   input wire                          master_ready_i
   );

   // States for Incoming Piton Messages
   localparam IDLE                 = 3'd0;  
   localparam WAITING              = 3'd1; 
   localparam BUSY                 = 3'd2; 
   
   //Determines if there is a value waiting in the buffer
   reg [2:0]                           state;
   reg [2:0]                           next_state;
   reg                                 loaded;

   always @(*) begin
      case (state)
	IDLE: begin
	   slave_ready_o <= 1'b1;
	   if (slave_valid_i) begin
	      master_valid_o <= slave_valid_i;
	      master_addr_o <= slave_addr_i;
	      master_prot_o <= slave_prot_i;
	      master_region_o <= slave_region_i;
	      master_len_o <= slave_len_i;
	      master_size_o <= slave_size_i;
	      master_burst_o <= slave_burst_i;
	      master_lock_o <= slave_lock_i;
	      master_cache_o <= slave_cache_i;
	      master_qos_o <= slave_qos_i;
	      master_id_o <= slave_id_i;
	      master_user_o <= slave_user_i;
	      loaded <= 1'b1;
	      next_state <= WAITING;
	   end // if (slave_valid_i)
	   else if (loaded) begin
	      next_state <= WAITING;
	   end
	   else begin
	      master_valid_o <= slave_valid_i;
	      next_state <= IDLE;
	   end // else: !if(slave_valid_i)
	end // case: IDLE
	WAITING: begin
	   loaded <= 1'b0;
	   slave_ready_o <= 1'b0;
	   if( master_ready_i) begin
	      next_state <= IDLE;
	   end
	   else begin
	      next_state <= WAITING;
	   end
	end
	BUSY: begin
	     loaded <= 1'b0;
	     slave_ready_o <= 1'b0;
	     next_state <= IDLE;
	  end
	default: next_state <= IDLE;
      endcase  
   end
   

   
   always @(posedge clk_i or negedge rst_ni)
     if ((rst_ni == 1'b0)) begin
	slave_ready_o <= 1'b0;
	master_valid_o <= 1'b0;
	master_addr_o <= {ADDR_WIDTH{1'b0}};
	master_prot_o <= 3'b000;
	master_region_o <= 4'b0000;
	master_len_o <= 8'b00000000;
	master_size_o <= 3'b000;
	master_burst_o <= 2'b00;
	master_lock_o <= 1'b0;
	master_cache_o <= 4'b0000;
	master_qos_o <= 4'b0000;
	master_id_o <= {ID_WIDTH{1'b0}};
	master_user_o <= {USER_WIDTH{1'b0}};
	state <= BUSY;
	next_state <= IDLE;
	loaded <= 1'b0;
     end
     else begin
        state <= next_state;	
     end
   
endmodule // slave_aw_buffer_i

