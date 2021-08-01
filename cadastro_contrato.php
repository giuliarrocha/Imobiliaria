<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css" />
    <title>Imobiliaria</title>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Asar&family=Playfair+Display+SC&family=Taviraj:wght@300&display=swap');
      </style>
  </head>
  <body>
    <!-- Bootstrap JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <div class="container-fluid h-100">
      <div class="row h-100">
        <div class="col-3" style="background-color: #063647; size: 20px;">
          <a href="" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-top: 40px; margin-left: 50px;">
            <img src="images/logo.png" width="40px" height="40px">
            <span class="fs-4" style="margin-left: 20px; font-family: 'Playfair Display SC', serif;"> 
              Imobiliária
            </span>
          </a>
          <hr style="color: #DFDFC9; margin-top: 40px;">
          <div class="list-group text-white" style="margin-top: 40px; background-color: #063647; font-family: 'Taviraj', serif;">
            <a href="index.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;"> Imóveis </a>
            <a href="clientes.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;"> Clientes </a>
            <a href="proprietarios.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Proprietários</a>
            <a href="corretores.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Corretores</a>
            <a href="contratos.php" class="list-group-item list-group-item-action text-white active" style="background-color: #063647; border-color: #DBA67B;" aria-current="true">
              Contratos
          </a>
          </div>
          <a class="btn text-dark" style="background-color: #DBA67B; margin-top: 30px; margin-left: 100px;" href="contratos.php" role="button">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
            </svg>
            &nbsp Voltar
          </a>
        </div>
        <div class="col" style="background-color: #DFDFC9;">
          <h1 class="h2 text-center" style="font-family: 'Playfair Display SC', serif; color: #A55C55; margin-left: 20px; margin-top: 35px; margin-bottom: 35px;">
              Cadastro de novo contrato
          </h1>
  
          <form action="back-end/add_contrato.php" method="post">
          <div class="card text-center">
              <div class="card-body">
                <div class="mb-3 row" style="margin-top: 20px;">
                    <label for="inputProprietario" class="col-sm-2 col-form-label text-start" style="margin-left: 10px;">Proprietário:</label>
                    <input class="form-control w-50"  name="inputProprietario" placeholder="Digite o CPF">
                    <!--
                    <datalist id="datalistOptions">
                      <option value="João">
                      <option value="44596357844">
                    </datalist>
                    -->
                    </div>
    
                    <div class="mb-3 row" style="margin-top: 20px;">
                        <label for="inputCorretor" class="col-sm-2 col-form-label text-start" style="margin-left: 10px;">Corretor:</label>
                        <input class="form-control w-50"  name="inputCorretor" placeholder="Digite o CPF">
                          <!--
                        <input class="form-control w-50" list="datalistOptions" id="exampleDataList" placeholder="Digite para pesquisar">
                        <datalist id="datalistOptions">
                          <option value="Nenhum">
                          <option value="João">
                          <option value="44596357844">
                        </datalist>
                        -->
                        </div>

                      <div class="mb-3 row" style="margin-top: 20px;">
                        <label for="" class="col-sm-2 col-form-label text-start" style="margin-left: 10px;">Imóvel:</label>
                        <input class="form-control w-50"  name="inputImovel" placeholder="Digite o código">
                        <!--
                        <input class="form-control w-50" list="datalistOptions" id="exampleDataList" placeholder="Digite para pesquisar">
                        <datalist id="datalistOptions">
                          <option value="João">
                          <option value="44596357844">
                        </datalist>
                        -->
                        </div>
        
                        <div class="mb-3 row" style="margin-top: 20px;">
                            <label for="inputCorretor" class="col-sm-2 col-form-label text-start" style="margin-left: 10px;">Cliente:</label>
                            <input class="form-control w-50"  name="inputCliente" placeholder="Digite o CPF">
                            <!--
                          <input class="form-control w-50" list="datalistOptions" id="exampleDataList" placeholder="Digite para pesquisar">
                          <datalist id="datalistOptions">
                            <option value="João">
                            <option value="44596357844">
                          </datalist>
                          -->
                          </div>

                    <div class="mb-3 row">
                        <label for="inputVencimento" class="col-sm-1 col-form-label">Venc.:</label>
                        <div class="col-sm-3">   
                            <input type="text" name="vencimento" class="col-sm-1 form-control" id="inputVencimento" placeholder="Digite o dia do vencimento (ex: 15)">
                          </div>
                          <label for="inputInicio" class="col-sm-1 col-form-label">Data Início:</label>
                          <div class="col">   
                            <input type="text" name="inicio" class="col-sm-1 form-control" id="inputInicio" placeholder="00/00/0000">
                          </div>
                          <label for="inputFinal" class="col-sm-1 col-form-label">Data Final:</label>
                          <div class="col-sm-3">   
                            <input type="text" name="final" class="col-sm-1 form-control" id="inputFinal" placeholder="00/00/0000"">
                          </div>
                      </div>

                    <div class="mb-3 row">
                        <label for="inputValor" class="col-1 col-form-label text-start">Valor:</label>
                        <div class="col-2">   
                          <input type="text" class="col form-control" name="inputValor" id="inputValor" placeholder="R$1.500,00">
                        </div>
                        <label for="inputPagamento" class="col-2 col-form-label">Pagamento:</label>
                        <div class="col-sm-4">   
                            <div class="input-group col-sm-6">
                                <select class="col-sm-6 form-select" name="inputPagamento" id="inputPagamento">
                                    <option selected>Escolha...</option>
                                    <option value="Boleto Bancário">Boleto Bancário</option>
                                    <option value="Cartão de crédito">Cartão de crédito</option>
                                    <option value="Débito em conta">Débito em conta</option>
                                    </select>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputAvaliacao" class="col-2 col-form-label text-start">Avaliação Corretor:</label>
                        <div class="col-4">   
                          <input type="number" class="col-sm-1 form-control" name="inputAvaliacao" id="inputAvaliacao" placeholder="0 a 10">
                        </div>
                    </div>
                    
                   
                  <button class="btn text-white" style="background-color: #A55C55;" type="submit" name="submit">Confirmar</button>

                </div>
            </div>
          </form>
      </div>

      </div>
      
    </div>
  </body>
</html>