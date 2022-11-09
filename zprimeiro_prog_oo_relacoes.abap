report zprimeiro_prog_oo_relacoes .

class lcl_selecao definition deferred .
class lcl_chuteira definition deferred .
class lcl_campo   definition deferred .

class lcl_pessoa definition .

  public section .

    data:
      nome          type string,
      idade         type i,
      cor_racial    type string,
      estilo_cabelo type string.

    methods falar .

endclass .

class lcl_tecnico definition inheriting from lcl_pessoa  .

  public section .

    data:
      selecao type ref to lcl_selecao .

endclass .

class lcl_jogador definition inheriting from lcl_pessoa  .

  public section .

    data:
      numero     type i,
      posicao    type string,
      posse_bola type boolean,
      selecao    type ref to lcl_selecao,
      chuteiras  type table of ref to lcl_chuteira,
      campo      type ref to lcl_campo.

    methods chutar .

    methods movimentar
      importing
        !distancia type p .

endclass .

class lcl_chuteira definition .

  public section .

    data:
      tamanho       type i,
      marca         type string,
      tamanho_trava type c,
      lado          type c.

endclass .

class lcl_selecao definition .

  public section .

    data:
      jogadores type table of ref to lcl_jogador,
      tecnico   type ref to lcl_tecnico.

    methods escalar_jogador
      importing
        !jogador type ref to lcl_jogador .

endclass .


class lcl_campo definition .

  public section .

    data:
      grama       type string,
      largura     type p,
      comprimento type p,
      jogadores   type table of ref to lcl_jogador.

endclass .


class lcl_pessoa implementation .

  method falar.
  endmethod .

endclass .

class lcl_jogador implementation .

  method chutar .
  endmethod .

  method movimentar .
  endmethod .

endclass .

class lcl_selecao implementation .

  method escalar_jogador .
  endmethod .

endclass .
