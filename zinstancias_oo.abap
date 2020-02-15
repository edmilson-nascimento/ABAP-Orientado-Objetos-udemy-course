report zinstancias_oo .


class lcl_loucutor definition .

  public section .

    data:
      nome            type string,
      idade           type i,
      ultima_mensagem type string.

    methods falar
      importing
        !iv_mensagem type string .

endclass .


start-of-selection .

  data:
    o_loucutor type ref to lcl_loucutor .

* create object o_loucutor .
  o_loucutor = new lcl_loucutor( ) .

  if ( o_loucutor is bound ) .
    write:/ 'Objeto criado.' .
  else .
    write:/ 'Objeto nao criado.' .
  endif .



class lcl_loucutor implementation .

  method falar .
  endmethod .

endclass .
