class c_2_1;
    rand bit[3:0] sa = 4'h0; // rand_mode = OFF 

    constraint addr_this    // (constraint_mode = ON) (randomizationTest.sv:20)
    {
       (sa == 4'hA);
    }
endclass

program p_2_1;
    c_2_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x1z110xx011xz010000x10z01zz1xxzxxxzxxxxxzzzzzxxxxxxxzzxzzxzzzx";
            obj.set_randstate(randState);
            obj.sa.rand_mode(0);
            obj.randomize();
        end
endprogram
