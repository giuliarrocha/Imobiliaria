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
            <a href="index.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;"> Imóveis </a>
            <a href="clientes.html" class="list-group-item list-group-item-action text-white active" style="background-color: #063647; border-color: #DBA67B;" aria-current="true">
              Clientes
            </a>
            <a href="proprietarios.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Proprietários</a>
            <a href="corretores.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Corretores</a>
            <a href="contratos.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Contratos</a>
          </div>
          <a class="btn text-dark" style="background-color: #DBA67B; margin-top: 30px; margin-left: 100px;" href="" role="button">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
            </svg>
            &nbsp Voltar
          </a>
        </div>
        <div class="col" style="background-color: #DFDFC9;">
          <h1 class="h2 text-center" style="font-family: 'Playfair Display SC', serif; color: #A55C55; margin-left: 20px; margin-top: 35px; margin-bottom: 35px;">
              Cadastro de novo cliente
          </h1>
  
          <form action="back-end/add_cliente.php" method="post">
          <div class="card text-center">
              <div class="card-body">

                    <div class="mb-3 row">
                        <label for="inputNome" class="col-sm-1 col-form-label">Nome:</label>
                        <div class="col">   
                          <input type="nome" class="col-sm-1 form-control" name="inputNome" id="inputNome" placeholder="Digite o nome completo">
                        </div>
                      </div>

                    <div class="mb-3 row">
                        <label for="inputCPF" class="col-sm-1 col-form-label">CPF:</label>
                        <div class="col">
                          <input type="CPF" class="form-control" id="inputCPF" name="inputCPF" placeholder="Digite o CPF">
                        </div>
                    </div>


                    <div class="row">
                        <label for="inputSexo" class="col-sm-1 col-form-label">Sexo:</label>
                        <div class="col-sm-2">
                            <div class="input-group col-sm-6">
                                <select class="col-sm-6 form-select" id="inputSexo" name="inputSexo">
                                <option value="M" selected>Escolha...</option>
                                <option value="M">M</option>
                                <option value="F">F</option>
                                </select>
                            </div>
                        </div>

                        <label class="col-sm col-form-label" for="inputEstadoCivil">Estado civil:</label>
                        <div class="col-sm-2">
                            <div class="input-group col-sm-6">
                                <select class="col-sm-6 form-select" id="inputEstadoCivil" name="inputEstadoCivil">
                                <option value="Solteiro(a)" selected>Escolha...</option>
                                <option value="Solteiro(a)">Solteiro(a)</option>
                                <option value="Casado(a)">Casado(a)</option>
                                <option value="Viúvo(a)">Viúvo(a)</option>
                                <option value="Divorciado(a)">Divorciado(a)</option>
                                </select>
                            </div>
                        </div>
                        
                        <label for="inputDataNasc" class="col col-form-label text-start">Data de nascimento:</label>
                        <div class="col text-start w-100">
                          <input type="dataNasc" class="form-control" id="inputDataNasc" name="inputDataNasc" placeholder="00/00/0000">
                        </div>
                    </div>

                    <div class="mb-3 row" style="margin-top: 20px;">
                        <label for="inputEmail" class="col-sm-1 col-form-label">Email:</label>
                        <div class="col-4">
                          <input type="email" class="col-sm-1 form-control" id="inputEmail" name="inputEmail" placeholder="exemplo@gmail.com">
                        </div>

                        <label for="inputTelefone1" class="col-sm col-form-label">Telefone 1:</label>
                        <div class="col-sm">   
                          <input type="telefone1" class="col-sm-1 form-control" id="inputTelefone1" name="inputTelefone1" placeholder="Insira o numero de telefone">
                        </div>
                        <label for="inputTelefone2" class="col-sm col-form-label">Telefone 2:</label>
                        <div class="col-sm w-100">   
                          <input type="telefone2" class="col-sm-1 form-control" id="inputTelefone2" name="inputTelefone2" placeholder="Insira o numero de telefone">
                        </div>
                      </div>


                    <div class="mb-3 row">
                        <label for="inputRua" class="col-sm-1 col-form-label">Rua:</label>
                        <div class="col-sm-3">   
                          <input type="rua" class="col-sm-1 form-control" id="inputRua" name="inputRua" placeholder="Digite o nome da rua">
                        </div>
                        <label for="inputNum" class="col-sm-1 col-form-label">Num:</label>
                        <div class="col">   
                          <input type="numero" class="col-sm-1 form-control" id="inputNum" name="inputNum" placeholder="Digite somente o número">
                        </div>
                        <label for="inputBairro" class="col-sm-1 col-form-label">Bairro:</label>
                        <div class="col-sm-3">   
                          <input type="bairro" class="col-sm-1 form-control" id="inputBairro" name="inputBairro" placeholder="Digite o nome do bairro">
                        </div>
                      </div>

                

                    <div class="mb-3 row">
                        <label for="inputCEP" class="col-sm-1 col-form-label">CEP:</label>
                        <div class="col">   
                          <input type="CEP" class="col-sm-1 form-control" id="inputCEP" name="inputCEP" placeholder="Insira somente os números, válido: 12345678">
                        </div>
                        <label for="inputCidade" class="col-sm-1 col-form-label">Cidade:</label>
                        <div class="col-sm-6">   
                          <input type="cidade" class="col-sm-1 form-control" id="inputCidade" name="inputCidade" placeholder="Digite o nome da cidade">
                        </div>
                    </div>

                    <div class="mb-3 row">
                      <label for="inputsalario" class="col-sm-1 col-form-label">Salário:</label>
                      <div class="col">   
                        <input type="salario" class="col-sm-1 form-control" id="inputsalario" name="inputsalario" placeholder="Exemplo: 1253,22">
                      </div>
                      <label for="inputprofissao" class="col-2 col-form-label">Profissão:</label>
                      <div class="col-sm-6">   
                        <input type="profissao" class="col-sm-1 form-control" id="inputprofissao" name="inputprofissao" placeholder="Digite a profissão">
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