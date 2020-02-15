report z_ola_mundo .

class lcl_ola_mundo definition .

  public section .
    methods dizer_ola_mundo .

endclass .

start-of-selection .

*  data:
*    lo_ola_mundo type ref to lcl_ola_mundo .
*
*  create object lo_ola_mundo .
*
*  lo_ola_mundo->dizer_ola_mundo( ) .

  new lcl_ola_mundo( )->dizer_ola_mundo( ) .

class lcl_ola_mundo implementation .

  method dizer_ola_mundo .
    write:/ 'Ola Mundo.' .
  endmethod .

endclass .
