// the adder with Cin, Cout and overflow
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

module add_with_Cout #(parameter DATA_LEN=32)(
    input  [DATA_LEN-1:0]   OP_A,
    input  [DATA_LEN-1:0]   OP_B,
    input                   Cin,
    output [DATA_LEN-1:0]   Sum,
    output                  overflow,
    output                  Cout
);

wire [DATA_LEN-1:0] a,b;

assign a = OP_A;
assign b = OP_B ^ {DATA_LEN{Cin}};

assign {Cout,Sum} = a + b +{{(DATA_LEN-1){1'b0}},Cin};

assign overflow = ((a[DATA_LEN-1]==b[DATA_LEN-1])&(a[DATA_LEN-1]!=Sum[DATA_LEN-1]));

endmodule //adadd_with_Cin

