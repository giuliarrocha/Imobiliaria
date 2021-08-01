<!doctype html>
<html lang="en">
    <?php
        if(!isset($_REQUEST['cpf'])) {
            header('Location: index.php');
            exit;
            return;
        } else {
            // prepara conexao
            $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
            
            if($conexao) {
                echo mysqli_connect_error();
            }
            $cpf = $_REQUEST['cpf'];
            $query = "SELECT * FROM corretor WHERE cpf = '$cpf'";
            $result = mysqli_query($conexao, $query) or die(mysql_error());

            if(!($row = mysqli_fetch_array($result))){
                header('Location: corretores.php');
                exit;
                return;
            }
        }
    ?>
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
            <a href="proprietarios.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;"> Proprietários </a>
            <a href="corretores.php" class="list-group-item list-group-item-action text-white active" style="background-color: #063647; border-color: #DBA67B;" aria-current="true">Corretores</a>
            <a href="contratos.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Contratos</a>
          </div>
          <a class="btn text-dark" style="background-color: #DBA67B; margin-top: 30px; margin-left: 100px;" href="corretores.php" role="button">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
            </svg>
            &nbsp Voltar
          </a>
        </div>
        <div class="col" style="background-color: #DFDFC9;">
          <h1 class="h2 text-center" style="font-family: 'Playfair Display SC', serif; color: #A55C55; margin-left: 20px; margin-top: 35px; margin-bottom: 35px;">
              Editar corretor
          </h1>
  
          <?php
          echo'
          <form action="back-end/atualizar_corretor.php" method="post">
          <div class="card text-center">
              <div class="card-body">
                <div class="mb-3 row">
                  <label for="inputNome" class="col-sm-1 col-form-label">Nome:</label>
                  <div class="col">   
                    <input type="text" class="col-sm-1 form-control" id="inputNome" placeholder="Digite o nome completo" value="'.$row['nome'].'" readonly>
                  </div>
                </div>

              <div class="mb-3 row">
                  <label for="inputCPF" class="col-sm-1 col-form-label">CPF:</label>
                  <div class="col">
                    <input type="text" class="form-control" id="inputCPF" placeholder="Digite o CPF" value="'.$row['cpf'].'" readonly>
                  </div>
              </div>


              <div class="row">
                  <label for="inputSexo" class="col-sm-1 col-form-label">Sexo:</label>
                  <div class="col-sm-2">
                      <div class="input-group col-sm-6">
                          <select class="col-sm-6 form-select" id="inputSexo" name="inputSexo">';
                                    if($row['sexo'] == 'M') {
                                        echo '<option selected value="M">M</option>
                                        <option  value="F">F</option>';
                                    } else if($row['sexo'] == 'F'){
                                        echo '<option value="M">M</option>
                                        <option selected value="F">F</option>';
                                    }else {
                                        echo '<option value="M">M</option>
                                        <option value="F">F</option>';
                                    }
                                    echo '
                                    </select>
                                </div>
                            </div>

                  <label for="inputDataContratacao" class="col col-form-label text-start">Data de contratação:</label>
                  <div class="col text-start w-100">
                    <input type="text" class="form-control" id="inputDataContratacao" placeholder="00/00/0000" value="'.date("d/m/Y", strtotime($row['dataContratacao'])).'" readonly>
                  </div>
                  
                  <label for="inputDataNasc" class="col col-form-label text-start">Data de nascimento:</label>
                  <div class="col text-start w-100">
                    <input type="text" class="form-control" id="inputDataNasc" placeholder="00/00/0000" value="'.date("d/m/Y", strtotime($row['dataNascimento'])).'" readonly>
                  </div>
              </div>

              <div class="mb-3 row" style="margin-top: 20px;">
                  <label for="inputEmail" class="col-sm-1 col-form-label">Email:</label>
                  <div class="col-4">   
                    <input type="text" class="col-sm-1 form-control" id="inputEmail" name="inputEmail" placeholder="exemplo@gmail.com" value="'.$row['email'].'">
                  </div>
                  <label for="inputAvaliacao" class="col-sm-2 col-form-label">Avaliação:</label>
                <div class="col-sm-4">   
                  <input type="text" class="col-sm-1 form-control" id="inputAvaliacao" placeholder="5" disabled readonly  value="'.$row['avaliacao'].'">
                </div>
              </div>';
                
              $query = "SELECT * FROM telefonecorretor WHERE cpfCorretor = '$cpf'";
              $result1 = mysqli_query($conexao, $query) or die(mysql_error());

              while($row1 = mysqli_fetch_array($result1)) {
                  echo '
                  <div class="mb-3 row">
                      <label for="inputTelefone" class="col-sm-2 col-form-label text-start">Telefone:</label>
                          <div class="col-sm-5">
                          <input type="text" class="col-sm-1 form-control" placeholder="Ex: (18) 98745-9633" value="'.$row1['numero'].'" readonly>
                          </div>
                  </div>';
              }
              echo '

                <div class="mb-3 row">
                  <label for="inputRua" class="col-sm-1 col-form-label">Rua:</label>
                  <div class="col-sm-3">   
                    <input type="text" class="col-sm-1 form-control" id="inputRua" name="inputRua" placeholder="Digite o nome da rua" value="'.$row['endRua'].'">
                  </div>
                  <label for="inputNum" class="col-sm-1 col-form-label">Num:</label>
                  <div class="col">   
                    <input type="text" class="col-sm-1 form-control" id="inputNum" name="inputNum" placeholder="Digite o número da rua" value="'.$row['endNum'].'">
                  </div>
                  <label for="inputBairro" class="col-sm-1 col-form-label">Bairro:</label>
                  <div class="col-sm-3">   
                    <input type="text" class="col-sm-1 form-control" id="inputBairro" name="inputBairro" placeholder="Digite o nome do bairro" value="'.$row['endBairro'].'">
                  </div>
                </div>

              <div class="mb-3 row">
                  <label for="inputCEP" class="col-sm-1 col-form-label">CEP:</label>
                  <div class="col">   
                    <input type="text" class="col-sm-1 form-control" id="inputCEP" placeholder="Insira CEP válido: 12345-678" value="'.$row['cep'].'" readonly>
                  </div>
                  ';

                  $cep = $row['cep'];
                  $query = "SELECT * FROM CEP_CidadeCorretor WHERE cep = '$cep'";
                  $result1 = mysqli_query($conexao, $query) or die(mysql_error());

                  if($row1 = mysqli_fetch_array($result1)) {
                    echo '
                    <label for="inputCidade" class="col-sm-1 col-form-label">Cidade:</label>
                    <div class="col-sm-6">   
                        <input type="text" class="col-sm-1 form-control" id="inputCidade" placeholder="Digite o nome da cidade" value="'.$row1['cidade'].'" readonly>
                    </div>';
                  }

                  echo '
              </div>

              <div class="mb-3 row">
                <label for="inputSalario" class="col-sm-1 col-form-label">Salário:</label>
                <div class="col">   
                  <input type="text" class="col-sm-1 form-control" id="inputSalario" name="inputSalario" placeholder="R$1.587,32" value="'.$row['salario'].'">
                </div>
                <label for="inputBonus" class="col-sm-1 col-form-label">Bônus:</label>
                <div class="col-sm-6">   
                  <input type="text" class="col-sm-1 form-control" id="inputBonus" placeholder="Nenhum" value="'.$row['bonus'].'" readonly>
                </div>
            </div>

            <div class="mb-3 row">
              <label for="inputConta" class="col-sm-1 col-form-label">Conta:</label>
              <div class="col-2">   
                <input type="text" class="col form-control" id="inputConta" placeholder="Digite o número da conta" value="'.$row['conta'].'" readonly>
              </div>
              <label for="inputAgencia" class="col-2 col-form-label text-center">Agência:</label>
              <div class="col-sm-3">
                <input type="text" class="col-sm-1 form-control" id="inputAgencia" placeholder="Digite o nome da agência" value="'.$row['agencia'].'" readonly>
              </div>';

              
              $agencia = $row['agencia'];
              $conta = $row['conta'];
              $query = "SELECT * FROM agencia_bancariaCorretor WHERE agenciaCorretor = '$agencia' AND contaCorretor  = '$conta'";
              $result1 = mysqli_query($conexao, $query);

              if($row1 = mysqli_fetch_array($result1)) {
                  echo '
                  <label for="inputBanco" class="col-sm-1 col-form-label">Banco:</label>
                  <div class="col-sm-3">
                    <input type="banco" class="col-sm-1 form-control" name="inputBanco" id="inputBanco" placeholder="Ex: Itaú" value="'.$row1['banco'].'" readonly>
                  </div>
                ';
              }
              echo '
            </div>

            <input type="text" class="d-none" name="inputC" value="'.$row['cpf'].'">             
            <button class="btn text-white" style="background-color: #A55C55;" type="submit" name="submit">Confirmar</button>

            </div>
            </div>
            </form>';
            ?>
          
      </div>

      </div>
      
    </div>
  </body>
</html>