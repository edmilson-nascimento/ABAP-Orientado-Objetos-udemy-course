report zatributos_oo .

class lcl_loucutor definition .

  public section .

    class-data:
      _instancia type ref to lcl_loucutor,
      _nome      type string.

    class-methods _gerar_instancia
      returning
        value(instancia) type ref to lcl_loucutor .

    data:
      nome            type string,
      idade           type i,
      ultima_mensagem type string.

    methods falar
      importing
        !iv_mensagem type string .

endclass .



class lcl_loucutor implementation .

  method falar .
  endmethod .

  method _gerar_instancia .
  endmethod .

endclass .
