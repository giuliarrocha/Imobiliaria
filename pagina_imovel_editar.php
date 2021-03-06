<!doctype html>
<html lang="en">
    <?php
        if(!isset($_REQUEST['codigo'])) {
            header('Location: index.php');
            exit;
            return;
        } else {
            // prepara conexao
            $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
            
            if($conexao) {
                echo mysqli_connect_error();
            }
            $codigo = $_REQUEST['codigo'];
            $query = "SELECT * FROM imovel WHERE codigo = '$codigo'";
            $result = mysqli_query($conexao, $query) or die(mysql_error());

            if(!($row = mysqli_fetch_array($result))){
                header('Location: index.php');
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
            <a href="index.php" class="list-group-item list-group-item-action text-white active" style="background-color: #063647; border-color: #DBA67B;" aria-current="true">
              Imóveis
            </a>
            <a href="clientes.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Clientes</a>
            <a href="proprietarios.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Proprietários</a>
            <a href="corretores.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Corretores</a>
            <a href="contratos.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Contratos</a>
          </div>
          <a class="btn text-dark" style="background-color: #DBA67B; margin-top: 30px; margin-left: 100px;" href="index.php" role="button">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
            </svg>
            &nbsp Voltar
          </a>
        </div>
        <div class="col" style="background-color: #DFDFC9;">
          <h1 class="h2 text-center" style="font-family: 'Playfair Display SC', serif; color: #A55C55; margin-left: 20px; margin-top: 35px; margin-bottom: 35px;">
              Editar imóvel
          </h1>
  
          <?php

          echo '
          <form action="back-end/atualizar_imovel.php" method="post">
          <div class="card text-center">
              <div class="card-body">

                  <div class="mb-3 row">
                  <label for="inputTipo" class="col-sm-1 col-form-label">Tipo:</label>
                  <div class="col-sm">
                      <div class="input-group col-sm-6">
                          <select class="col-sm-6 form-select" name="inputTipo" id="inputTipo">
                          
                          <option ';if($row['tipo'] == "Casa Residencial") echo 'selected '; echo ' value="Casa Residencial">Casa Residencial</option>
                          <option ';if($row['tipo'] == "Kitnet") echo 'selected '; echo 'value="Kitnet">Kitnet</option>
                          <option ';if($row['tipo'] == "Apartamento") echo 'selected '; echo 'value="Apartamento">Apartamento</option>
                          <option ';if($row['tipo'] == "Casa Residencial") echo 'selected '; echo 'value="Sala comercial">Sala comercial</option>
                          <option ';if($row['tipo'] == "Local comercial") echo 'selected '; echo 'value="Local comercial">Local comercial</option>
                          <option ';if($row['tipo'] == "Edícula") echo 'selected '; echo 'value="Edícula">Edícula</option>
                          <option ';if($row['tipo'] == "Cobertura") echo 'selected '; echo 'value="Cobertura">Cobertura</option>
                          <option ';if($row['tipo'] == "Galpão") echo 'selected '; echo 'value="Galpão">Galpão</option>
                          </select>

                      </div>
                  </div>
                </div>

                <div class="mb-3 row" style="margin-top: 20px;">
                  <label for="inputCodigo" class="col-sm-1 col-form-label text-start" style="margin-left: 10px;">Código:</label>
                  <div class="col-sm-3">   
                    <input type="text" class="col-sm-1 form-control" id="inputCodigo" placeholder="9564" value="'.$row['codigo'].'" disabled readonly>
                  </div>
                  <label for="inputAlugado" class="col-sm-2 col-form-label text-end" >Alugado:</label>
                  <div class="input-group col-sm-3 w-25">
                    <select class="col-sm-3 form-select" name="inputAlugado" id="inputAlugado">
                    ';
                    if($row['alugado'] == '1') {
                        echo '<option selected value="1">Sim</option>
                        <option value="0">Não</option>';
                    } else {
                        echo '<option  value="1">Sim</option>
                        <option selected value="0">Não</option>';
                    }
                    
                    echo '
                    </select>
                  </div>
                </div>

                <div class="mb-3 row" style="margin-top: 20px;">
                  <label for="inputRua" class="col-sm-1 col-form-label">Rua:</label>
                  <div class="col-sm-3">   
                    <input type="text" class="col-sm-1 form-control" name="inputRua" id="inputRua" placeholder="Rua Flores" value="'.$row['endRua'].'">
                  </div>
                  <label for="inputNum" class="col-sm-1 col-form-label">Num:</label>
                  <div class="col">   
                    <input type="text" class="col-sm-1 form-control" name="inputNum" id="inputNum" placeholder="12" value="'.$row['endNum'].'">
                  </div>
                  <label for="inputBairro" class="col-sm-1 col-form-label">Bairro:</label>
                  <div class="col-sm-3">   
                    <input type="text" class="col-sm-1 form-control" name="inputBairro" id="inputBairro" placeholder="Jardim Tulipas" value="'.$row['endBairro'].'">
                  </div>
                </div>

              <div class="mb-3 row">
                  <label for="inputCEP" class="col-sm-1 col-form-label">CEP:</label>
                  <div class="col">   
                    <input type="text" class="col-sm-1 form-control" name="inputCEP" id="inputCEP" placeholder="12345-678" value="'.$row['cep'].'" readonly>
                  </div>
                  ';



                  $cep = $row['cep'];
                  $query = "SELECT * FROM CEP_CidadeImovel WHERE cep = '$cep'";
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
                <label for="inputTamanho" class="col-2 col-form-label text-start">Tamanho:</label>
                <div class="col">   
                  <input type="text" class="col-sm-1 form-control" name="inputTamanho" id="inputTamanho" placeholder="400 m²" value="'.$row['tamanho'].'">
                </div>
              </div>';

              $query = "SELECT * FROM gerencia, corretor WHERE cpfCorretor = cpf AND codImovel = '$codigo'";
              $result1 = mysqli_query($conexao, $query) or die(mysql_error());
  
              if($row1 = mysqli_fetch_array($result1)) {
                echo '<div class="mb-3 row">
                <label for="inputTamanho" class="col-2 col-form-label text-start">Corretor:</label>
                <div class="col">
                    <input type="text" class="col-sm-1 form-control" value="'.$row1['nome'].'" readonly>
                </div>
                </div>';
                }
                echo '
              <input type="text" class="d-none" name="inputC" value="'.$row['codigo'].'">             
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