class c_1_1;
    rand bit[3:0] sa = 4'h0; // rand_mode = OFF 

    constraint addr_this    // (constraint_mode = ON) (randomizationTest.sv:20)
    {
       (sa == 4'hA);
    }
endclass

program p_1_1;
    c_1_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1110z0xz1zz110z00x010zxx0zxx1z0xxxxxxzzzxxzxxzzxxxzxxxzxxxzxzzz";
            obj.set_randstate(randState);
            obj.sa.rand_mode(0);
            obj.randomize();
        end
endprogram
