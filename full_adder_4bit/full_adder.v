module full_adder (a,b,cin,sum,cout);

input a,b,cin;
output sum,cout;

wire w1,w2,w3;

half_adder U1(.a(a), .b(b), .sum(w1), .cout(w2));
half_adder U2(.a(w1), .b(cin), .sum(sum), .cout(w3));
or (cout,w2,w3);

endmodule