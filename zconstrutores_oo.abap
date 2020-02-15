REPORT zconstrutores_oo.


class lcl_dominio definition.
  public section.
    data:
      nome  type dd01l-domname,
      tab_a type table of dd07v,
      tab_b type table of dd07v.

    class-methods:
      class_constructor.

    methods:
      constructor importing iv_nome type dd01l-domname,
      resgatar_valores.
endclass.
**********************************************************************

start-of-selection.
  data:
    lo_dominio_xfeld type ref to lcl_dominio.

*  CREATE OBJECT lo_dominio_xfeld.
  create object lo_dominio_xfeld
    exporting
      iv_nome = 'XFELD'.

  create object lo_dominio_xfeld
    exporting
      iv_nome = 'XFELD'.

  create object lo_dominio_xfeld
    exporting
      iv_nome = 'XFELD'.

  create object lo_dominio_xfeld
    exporting
      iv_nome = 'XFELD'.





**********************************************************************
class lcl_dominio implementation .

  method resgatar_valores .

    call function 'DD_DOMA_GET'
      exporting
        domain_name   = nome
      tables
        dd07v_tab_a   = tab_a
        dd07v_tab_n   = tab_b
      exceptions
        illegal_value = 1
        op_failure    = 2
        others        = 3.

    if sy-subrc <> 0 .
      "Deu erro, mas n„o faÁa nada
    endif .

  endmethod.

  method constructor.
    nome = iv_nome.
    write:/ 'O domÌnio', nome, 'foi criado'.
  endmethod.

  method class_constructor.
    write:/ 'Classe iniciada'.
  endmethod.
  
endclass.
