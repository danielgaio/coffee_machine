

`timescale 1ns/1ns

module coffee_machine_tb;


  // inputs of dut as reg
  reg clock_tb, reset_tb, money_in025_tb, money_in05_tb, money_in1_tb;



  // outputs of dut as wire
  wire sai_cafe_tb;
  wire [9:0]coffee_counter_tb;




  // Instanciando o módulo
  coffee_machine my_coffee_machine_DUT (
    .clock(clock_tb),
    .reset(reset_tb),
    .money_in025(money_in025_tb),
	  .money_in05(money_in05_tb),
	  .money_in1(money_in1_tb),
    .sai_cafe(sai_cafe_tb),
    .coffee_counter(coffee_counter_tb)
  );





  // etapa de reset
  initial begin
    reset_tb = 1;
  end





  // Gerador de clock
  initial clock_tb = 0;
  always begin #5 clock_tb = ~clock_tb; $display("time: %d", $time); end




  // estimulos de teste
  initial begin
    
    #3
    reset_tb = 0;
    $display("n coffees: %d", coffee_counter_tb);



    // a seguir estão algumas sequencias de sinais de entrada com seus tempos de espera inseridos após inpeção manual
    // do tempo necessário para os sinais fiquem sincronizados



    // simular compra de caf´e com moedas de 0.25
    money_in025_tb = 1;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #32 // ate aqui sai um cafe com moedas de 0.25
    money_in025_tb = 0;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #20 // periodo de espera
    $display("n coffees: %d", coffee_counter_tb);





    // agora simular compra com moedas de 50 centavos
    money_in025_tb = 0;
    money_in05_tb = 1;
    money_in1_tb = 0;
    #20 // ate aqui sai um cafe com moedas de 0.5
    money_in025_tb = 0;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #20 // periodo de espera
    $display("n coffees: %d", coffee_counter_tb);





    // agora simular compra com moedas de 1 real
    money_in025_tb = 0;
    money_in05_tb = 0;
    money_in1_tb = 1;
    #10 // ate aqui sai um cafe com moedas de 1
    money_in025_tb = 0;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #20 // periodo de espera
    $display("n coffees: %d", coffee_counter_tb);






    // agora simular compra com moedas de 0.5 e 1 real
    money_in025_tb = 0;
    money_in05_tb = 1;
    #5
    money_in05_tb = 0;
    money_in1_tb = 1;
    #5 // ate aqui sai um cafe com moedas de 0.5 e 1 real
    money_in025_tb = 0;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #20 // periodo de espera
    $display("n coffees: %d", coffee_counter_tb);






    // agora simular compra com moedas de 0.5 e 1 real
    money_in025_tb = 0;
    money_in05_tb = 1;
    #5
    money_in05_tb = 0;
    money_in1_tb = 1;
    #5 // ate aqui sai um cafe com moedas de 0.5 e 1 real
    money_in025_tb = 0;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #20 // periodo de espera
    $display("n coffees: %d", coffee_counter_tb);






    // simular compra de caf´e com moedas de 0.25
    money_in025_tb = 1;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #40 // ate aqui sai um cafe com moedas de 0.25
    money_in025_tb = 0;
    money_in05_tb = 0;
    money_in1_tb = 0;
    #20 // periodo de espera
    $display("n coffees: %d", coffee_counter_tb);

    $stop;

  end 
  
endmodule
