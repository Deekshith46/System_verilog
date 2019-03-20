

/////////////////////////////////Chapter-1/////////////////////////////////////

//////////////////////////Parameter////////////////////////
/*
module tb;
    parameter cycle = 5;
    reg clk;

    always begin
        clk = 0;
        forever #cycle clk = ~clk;
    end

    initial begin
        $shm_open("wave.shm");
        $shm_probe("ACTMF");
    end
    
    initial begin
        #200;
        $finish();
    end

endmodule:tb
*/

///////////////////////////////Datatypes//////////////////////////////

/* 
module tb;
bit clk;            //2-state bit value 0 or 1 
bit[31:0] data;     //2-state 32 bits unsigned integer
int count;          //2-state 32 bits signed integer
int unsigned cnt;   //2-state 32 bits unsigend integer
byte crc_byte;      //2-state 8 bits signed integer
shortint sint;      //2-state 16 bits signed integer
longint lint;       //2 state 64 bits signed integer

    initial begin
        repeat(3)begin
        clk = $urandom;
        data = $urandom;
        count = $urandom;
        cnt = $urandom;
        crc_byte = $urandom;
        sint = $urandom;
        lint = $urandom;

        $display("Clock = %0d\n Data = %0d\n count = %0d\n cnt=%0d\n crc_byte = %0d\n sint=%0d\n lint=%0d",clk,data,count,cnt,crc_byte,sint,lint);
        end
    end
endmodule:tb*/


////////////////////////////////enumerate////////////////////////////////////

/*
module tb;
    enum {red, green, blue, yellow, white , black} colors;            
            initial begin
            colors = colors.first;
            $display("The color is =%0s and value is %0d",colors.name,colors);
            end    
endmodule:tb
*/

////////////////////////////////Typedef///////////////////////////////

/*
module tb;
   typedef enum {red, green, blue, yellow, white , black} colors; 

   colors color;
            initial begin
            color = color.last; //first(),last(),next(),prev(),
            $display("The color is =%0s and value is %0d",color.name,color);
            end    
endmodule:tb*/

//////////////////////////////Stirng_data_type////////////////////////

/*
module tb;
    
        string str;

        initial begin
            str = "VIVARTAN";
            $display("Character in 5th position in %s", str);
            str = str.tolower();
            $display("Character in 5th position in %s", str.getc(5));
            str = {{3{"w"}},".",str};
            $display("Character in 5th position in %s", str);
            str = {str,".","com"};
            $display("Character in 5th position in %s", str);
            end
endmodule*/


//////////////////////////////////Chapter-2/////////////////////////////////

////////////////////////////ARRAYS//////////////////////////////

///Packed Array///////
    /////Sytax/////
            //<array_type><Packed_dimension>array_name;
  //1D-array//              
/*
module tb;
    bit[7:0] packed_array;
        initial begin
            packed_array = 8'b0101_1010;
            for(int i = 0 ; i<$size(packed_array);i++)
                begin
                    $display("The 1-D value is Data[%0d] = %0d",i,packed_array[i]);
                end
        end
endmodule*/

//2D-array//
/*
module tb;
    bit[3:0][7:0] packed_array;
        initial begin
            packed_array = 32'hfefe_efef;
            $display("The packed_array=%0b",packed_array);
            for(int i = 0 ; i<$size(packed_array);i++)
                begin
                    $display("The 1-D value is Data[%0d] = %0b",i,packed_array[i]);
                end
        end
endmodule*/

///////////////////Array copy and compare////////////////

/*module tb;
    
        int arr1[5];
        int arr2[5];

        initial begin
            for(int i = 0 ; i<$size(arr1);i++)
            begin
                arr1[i] = i;                
            end
            $display("THE ARRAY1 IS %0p",arr1);

             arr2 = arr1;
            $display("THE ARRAY2 IS %0p",arr2);
        end
endmodule:tb*/

///////////////////////compare/////////////////

/*
module compare;

        int arr1[5] = '{1,2,3,4,5};
        int arr2[5] = '{1,2,3,4,6};
        initial begin
            if(arr1==arr2)
                $display("array is same");
                else
                    $display("array is not same");
        end
endmodule:compare*/
/////////////////////////////////////DYNAMIC_ARRAY////////////////////////////////
/*
module dynamic_array;
    int dyn1[];
    int dyn2[];

    initial begin
        dyn1 = new[5];
        for(int i = 0 ; i<$size(dyn1) ; i++)
            begin
                dyn1[i] = i;
                end
                $display("The array1 of value is %0p",dyn1);
    end
endmodule*/


/*
module dynamic_array;
    int dyn1[];
    int dyn2[];

    initial begin
        dyn1 = new[5];
        for(int i = 0 ; i<$size(dyn1) ; i++)
            begin
                dyn1[i] = i;
                end
                $display("The array1 of value is %0p",dyn1);
                dyn1 = new[10](dyn1);
                $display("The array1 of value is %0p",dyn1); //new memory is created
                dyn2 = dyn1;
                $display("The array2 of value is %0p",dyn2);
    end
endmodule*/

//////////////////////////////////QUEUES/////////////////////////////////////

/*module queues;
    int q1[$] = '{1,2,3,4,5,6};
    int q2[$] = '{2,3};
    int k =2;

    initial begin
        q1.insert(1,k);
         $display("The queue of value is %0p",q1);
        q1.delete(1);
         $display("The queue of value is %0p",q1);
        q1.push_front(7);
        $display("The queue of value is %0p",q1);
        q1.pop_back();
        $display("The queue of value is %0p",q1);
        q2.push_back(4);
         $display("The queue of value is %0p",q2);
    end
endmodule*/

/////////////////////////ASSOCIATIVE_ARRAY////////////////////////////

/*
module asso_arry;
    int mem[int];
   
   initial begin
    mem[3] = 5;
    mem[2] = 1;
    mem[35] = 60;
    mem[2000] = 89;

    if(mem.exists(35))
        $display(" Its is present = %0d",mem[35]);
        else
            $display(" Its is not present");
   end
endmodule*/

////////////////////////////Array_shorting_method////////////

/*
module array_short;
    int packet[10] = {1,2,3,4,5,6,7,8,10,9};
        
          initial begin
            packet.reverse();
            $display("The reverse of array is %0p",packet);
            packet.sort();
            $display("The sort of array is %0p",packet);
            packet.rsort();
            $display("The reverse sort of array is %0p",packet);
            packet.shuffle();
            $display("The shuffle of array is %0p",packet);
          end

endmodule*/

///////////////////////////TASK////////////////////////////////
   ///////snytax///////
            ///task <life_time> <task_identifier>(<formal argumets>);
                        //<task body>
            /// endtask

/*
module taskone;
    
        int a = 1;
        int b = 2;
        int sum;

    task run();
        sum = a +b;
        $display("The sum is = %0d",sum);
    endtask

    initial begin
    run();
    end
endmodule*/

/*
module tasktwo;
    
        task run(input int a , input int b , output int sum);
        sum = a +b;
        $display("The sum is = %0d",sum);
    endtask

    initial begin
    run(1,2);
    end
endmodule*/

/*
module taskthree;
    
        int a;
        int b;

        task run(input int a , input int b , output int sum);
        sum = a +b;
        $display("The sum is = %0d",sum);
    endtask

    initial begin
    a = 1;
    b =2;
    run(a,b);
    end
endmodule*/

//////////////////////////Static task//////////////////////////

/*
module statictask;

    task static static_task();
        int counter =0;
        counter++;
        $display("counter value : %0d",counter);
    endtask

    initial begin
    static_task();
    static_task();
    end
endmodule*/

///////////////////////////////Automatic_Task//////////////////////////////////
/*
module automatic_task;

    task automatic automatic_task();
        int counter =0;
        counter++;
        $display("counter value : %0d",counter);
    endtask

    initial begin
    automatic_task();
    automatic_task();
    end
endmodule*/

/////////////////////////////////FUNCTION//////////////////////////////////

/*module functionone;
    int x;

    function int sum(input int a ,input int b);
    return a+b;
    endfunction
    
    initial begin
    x = sum(1,2);
    $display("The value is sum = %0d",x);
    end
endmodule*/


/*module functiontwo;
    int x;

    function int sum(input int a ,input int b);
    return a+b;
    endfunction
    
    function void display(input string name);
        $display("[%0s],The sum of value sum = %0d",name,x);
    endfunction

    initial begin
    x = sum(1,2);
    display("add");
   // $display("The value is sum = %0d",x);
    end
endmodule*/

///////////////////////////////////////OOPS//////////////////////////////////////////
    ////////syntax///////

            //class<class_identifier>
                //<class_properties>
                //<class_method>
           //endclass:<class_identifier>
/*
class transaction;
    int a=1;
    int b=2;
endclass:transaction

module tb;
transaction trans;

    initial begin
        trans = new();
        $display("The value is a = %0d and b = %0d ", trans.a,trans.b);
    end
 endmodule*/


/*class transaction;
    int a;
    int b;
    int sum;

    task run();
        sum = a + b;  
    endtask

    function void display();
     $display("The value is a = %0d and b = %0d sum =%0d",a,b,sum);   
    endfunction

endclass:transaction

module tb;
transaction trans;

    initial begin
        trans = new();
        trans.a = 2;
        trans.b = 3;
        trans.run();
        trans.display();
    end
 endmodule*/


//////////////////////////////Copy//////////////////////////////

/*
class transaction;
    int a;
    int b;
    int sum;

    task run();
        sum = a + b;  
    endtask

    function void display();
     $display("The value is a = %0d and b = %0d sum =%0d",a,b,sum);   
    endfunction

endclass:transaction

module tb;
transaction trans1, trans2;

    initial begin
        trans1 = new();
        trans1.a = 2;
        trans1.b = 3;
        trans1.run();
        trans1.display();
        trans2 = trans1;
        $display("The Tran2_a = %0d,trans2_b = %0d ,trans2_sum=%0d",trans2.a,trans2.b,trans2.sum);
       end
 endmodule*/

//////////////////////////////This_keyword////////////////////////////////

/*
class transaction;
bit[31:0] addr;
bit[31:0] data;

    function new(bit[31:0] addr,bit[31:0] data);
        this.addr = addr;
        this.data = data;
    endfunction

    function void display(input string name);
        $display("[%s], addr = %0d , data = %0d ",name, addr,data); 
    endfunction
endclass

module tb;
    transaction trans;

        initial begin
            trans = new(4,5);
            trans.display("this_keyword");
        end
endmodule*/




///////////////////////////////////////////SHALLOW COPY////////////////////////////////////////

/*
class mydata;
    int value;
endclass

module shallow_copy;
    mydata shallow,original;


        initial begin
            original = new();
            original.value = 42;

            shallow = original;

            $display("original value :%0d",original.value);
            $display("shallow value :%0d",shallow.value);

            //modify th shallow copy

            shallow.value = 99;
            $display("After modification");
            $display("original value :%0d",original.value);
            $display("shallow value :%0d",shallow.value);


        end
endmodule*/

//////////////////////////////DEEP COPY///////////////////////////


/*
class sub;
    int i;

    function sub copy();
        copy = new();
        copy.obj = this.obj;
endclass

class trans;
    int data;
    sub sub_h = new();

    function trans copy();
        copy = new();
        copy.data = this.data;
        copy.sub_h = thid.sub_h.copy;
    endfunction

endclass

module tb;
    trans t_h1 ,t_h2;
    initial begin
        t_h1 = new();
        t_h1.data = 4;
        t_h1.sub_h.obj = 5;
        t_h2 = t_h1.copy;
        t_h2.sub_h.obj =10;        
    end
endmodule */

///////////////////////////////INHERITANCE/////////////////////

/*
class parents_class;

        bit[31:0] addr;

endclass

class child_class extends parents_class;

        bit[31:0] data;

        function void display(input string name);
            $display("[%0s] The address = %0d and the data = %0d",name,addr,data);
        endfunction
    
endclass

module tb;
child_class cls;

    initial begin
        cls = new();
        cls.data = 1;
        cls.addr = 8;
        cls.display("inheritance");
    end
endmodule*/

///////////////////////////////POLYMORPHISM//////////////////

/*
class parent_class;
 
 virtual function void display();
    $display("The parent_class");
 endfunction

endclass


class child_class1 extends parent_class;

 function void display();
    $display("The child_class1 ");
 endfunction

endclass

class child_class2 extends parent_class ;

 function void display();
    $display("The child_class2  ");
 endfunction

endclass



module tb;
    child_class1 child1;
    child_class2 child2;

     parent_class parent1 , parent2;

    
    initial begin
        child1 =new();
        child2 =new();

       
        parent1 = child1;
        parent2 = child2;

        parent1.display();
        parent2.display();

    end
    
endmodule*/

///////////////////////////////SUPER KEYWORD//////////////////////

/*
class parent_class;
    
    function void display();
    $display("The parent class");
    endfunction

endclass

class child_class extends parent_class;
    
    function void display();
    $display("The child class");
    super.display();
    endfunction

endclass

module tb;

    child_class child;

    initial begin
        child = new();
        child.display();
    end

endmodule*/

/////////////////////////////////RANDOMIZATION////////////////////////

/*class packet;
        rand  bit[31:0] addr;
        randc bit[31:0] data;

        function void display(input string tag);
            $display("[%0s] The randomize addr = %0d and data = %0d",tag , addr,data);
        endfunction

    endclass

    module tb;
    packet pack;
        
        initial begin
        repeat(10)begin
            pack = new();
            pack.randomize();
            pack.display("randomize");
               
          end
        end
    endmodule  */

//////////////////////////////////////////////////condition////////////////////////////////

/*    class packet;
        rand  bit[31:0] addr;
        randc bit[31:0] data;

        function void display(input string tag);
            $display("[%0s] The randomize addr = %0d and data = %0d",tag , addr,data);
        endfunction

    endclass

    module tb;
    packet pack;
        
        initial begin
        repeat(10)begin
            pack = new();
            if(pack.randomize())
                begin
                $display("The randomize is success");
                 pack.display("randomize");
                 end
                else begin
                 $display("The randomize is not success");
                end

          end
        end
    endmodule*/

//////////////////////////////////////RAND MODES///////////////////////////
/*
class packet;
        rand  bit[31:0] addr;
        randc bit[31:0] data;

        function void display(input string tag);
            $display("[%0s] The randomize addr = %0d and data = %0d",tag , addr,data);
        endfunction

    endclass

    module tb;
    packet pack;
        
        initial begin
        repeat(10)begin
            pack = new();
            pack.addr.rand_mode(0);
            pack.randomize();
            pack.display("randomize");
               
          end
        end
    endmodule */

//////////////////////////pre randomize and post randomize///////////////////////

/*
class Mypacket;
    rand bit[3:0] addr;
    rand bit[7:0] data;

    bit[7:0] checksum;

    /////called befor randomize
        function void pre_randomize();
            $display("====pre_randomize() called===");
            $display("Preparing to randomize : clearing checksum");
            checksum =0;
        endfunction

    //called after randomize
        function void post_randomize();
            checksum = addr +data;
            $display("====post_randomize() called===");
            $display("computed checksum =%0d", checksum);
        endfunction
endclass

module test;
    Mypacket pkt;

        initial begin
            pkt = new();

            $display("===Before randomize()===");
            $display("addr = %0d",pkt.addr);
            $display("data = %0d",pkt.data);
            $display("checksum = %0d",pkt.checksum);

           void'( pkt.randomize());

            $display("===After randomize()===");
            $display("addr = %0d",pkt.addr);
            $display("data = %0d",pkt.data);
            $display("checksum = %0d",pkt.checksum);

        end
endmodule*/











