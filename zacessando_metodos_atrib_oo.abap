report zacessando_metodos_atrib_oo .

class lcl_dominio definition.

  public section.
    data:
      nome  type dd01l-domname,
      tab_a type table of dd07v,
      tab_b type table of dd07v.

    class-methods
      class_constructor .

    class-methods _gerar_dominio
      importing
        !iv_nome         type dd01l-domname
      returning
        value(instancia) type ref to lcl_dominio .


    methods constructor
      importing
        !iv_nome type dd01l-domname .

    methods resgatar_valores.

    methods lista_valores .

  protected section .

  private section .

endclass.



start-of-selection.
  data:
    lo_dominio type ref to lcl_dominio.

*  call method lcl_dominio=>_gerar_dominio
*    exporting
*      iv_nome   = 'XFELD'
*    receiving
*      instancia = lo_dominio_xfeld.

  lo_dominio = lcl_dominio=>_gerar_dominio( 'XFELD' ) .
  write:/ 'O nome do dominio e:', lo_dominio->nome .
  lo_dominio->lista_valores( ) .

  lo_dominio = lcl_dominio=>_gerar_dominio( 'BSTAT' ) .
  write:/ 'O nome do dominio e:', lo_dominio->nome .
  lo_dominio->lista_valores( ) .


class lcl_dominio implementation .

  method resgatar_valores .

    call function 'DD_DOMA_GET'
      exporting
        domain_name   = nome
      tables
        dd07v_tab_a   = me->tab_a
        dd07v_tab_n   = tab_b
      exceptions
        illegal_value = 1
        op_failure    = 2
        others        = 3.

    if ( sy-subrc eq 0 ) .
    else .
    endif .

  endmethod.

  method constructor.

*   Atribuicao do nome
    nome = iv_nome  .
*   Chamada de metodo
    me->resgatar_valores( ) .

  endmethod.

  method class_constructor.
    write:/ 'Classe iniciada'.
  endmethod.

  method _gerar_dominio .

    create object instancia
      exporting
        iv_nome = iv_nome.

  endmethod .

  method lista_valores .

    loop at me->tab_a into data(line) .
      write:/ line .
    endloop.

  endmethod .

endclass.
