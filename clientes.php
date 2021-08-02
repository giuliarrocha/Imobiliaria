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
            <a href="clientes.php" class="list-group-item list-group-item-action text-white active" style="background-color: #063647; border-color: #DBA67B;" aria-current="true">
              Clientes
            </a>
            <a href="proprietarios.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Proprietários</a>
            <a href="corretores.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Corretores</a>
            <a href="contratos.php" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Contratos</a>
          </div>
        </div>
        
            
        <div class="col" style="background-color: #DFDFC9;">
          <h1 class="h2 text-center" style="font-family: 'Playfair Display SC', serif; color: #A55C55; margin-left: 20px; margin-top: 35px; margin-bottom: 35px;">
              Clientes
          </h1>
  
          <div class="card w-75" style="margin-left: 140px; margin-bottom: 35px;">
          <form action="" method="post">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Buscar:</label>
                            <input type="busca" class="form-control " id="busca" name="busca" placeholder="Digite o que deseja procurar">
                        </div>
                    </div>
                    <div class="col">
                        
                        <label for="exampleFormControlInput1" class="form-label">Em:</label>
                        <select class="form-select" aria-label="Default select example" name="consulta">
                            <option selected value="0">Todos os campos</option>
                            <option value="1">CPF</option>
                            <option value="2">Nome</option>
                            <option value="3">Data de nascimento</option>
                            <option value="4">CEP</option>
                            <option value="5">Rua e número</option>
                            <option value="6">Bairro</option>
                            <option value="7">Estado Civil</option>
                            <option value="8">E-mail</option>
                            <option value="9">Sexo</option>
                            <option value="10">Salário</option>
                            <option value="11">Profissão</option>
                        </select>
                    </div>
                    <div class="col">
                                <label for="exampleFormControlInput1" class="form-label">Ordenar por:</label>
                            
                                <select class="form-select" aria-label="Default select example" name="ordenar">
                                    <option selected value="0">CPF</option>
                                    <option value="1">Nome</option>
                                    <option value="2">Sexo</option>
                                    <option value="3">Data de Nascimento</option>
                                    <option value="4">Data Cadastro</option>
                                    <option value="5">E-mail</option>
                                </select>
                    </div>
                </div>
                
                <div class="row">
                <button class="btn text-white w-50" style="background-color: #A55C55; margin-top: 30px;; margin-left: 150px;" type="submit" name="submit">Pesquisar</button>
                </div>
                <div class="row">
                
                  <a class="btn text-white w-50" style="background-color: #A55C55; margin-top: 25px; margin-left: 150px;" href="cadastro_cliente.php" role="button">Cadastrar Novo Cliente</a>
                </div>
            </div>
            </form>
        </div>
          
          <div class="card text-center">
              <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="true" href="#">Dados</a>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                  <table class="table table-bordered">
                      <thead>
                          <tr>
                            <th scope="col">CPF</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Sexo</th>
                            <th scope="col">Data Nascimento</th>
                            <th scope="col">Data Cadastro</th>
                            <th scope="col">E-mail</th>
                            <th scope="col">Ações</th>
                          </tr>
                        </thead>
                        <tbody>
                            <?php
                            $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
                            
                            if($conexao) {
                                echo mysqli_connect_error();
                            }
                            if(isset($_REQUEST['submit'])) {
                            $qual = $_REQUEST['consulta'];
                            $busca = $_REQUEST['busca'];

                            switch($qual) {
                                case '0':
                                    $query="SELECT * FROM cliente ";
                                    break;
                                case '1':
                                    $query="SELECT * FROM cliente WHERE cpf='$busca'";
                                    break;
                                case '2':
                                    $query="SELECT * FROM cliente WHERE nome LIKE '%$busca%'";
                                    break;
                                case '3':
                                    
                                    $inputDataNasc1 = str_replace("/", "-", $busca);
                                    $inputDataNasc =  date('Y-m-d', strtotime($inputDataNasc1));
                                    $query="SELECT * FROM cliente WHERE dataNascimento='$inputDataNasc'";
                                    break;
                                case '4':
                                    $query="SELECT * FROM cliente WHERE cep='$busca'";
                                    break;
                                case '5':
                                    $query="SELECT * FROM cliente WHERE endRua LIKE '%$busca%' OR endNum LIKE '%$busca%'";
                                    break;
                                case '6':
                                    $query="SELECT * FROM cliente WHERE endBairro LIKE '%$busca%'";
                                    break;
                                case '7':
                                    $query="SELECT * FROM cliente WHERE estadoCivil LIKE '%$busca%'";
                                    break;
                                case '8':
                                    $query="SELECT * FROM cliente WHERE email LIKE '%$busca%'";
                                    break;
                                case '9':
                                    $query="SELECT * FROM cliente WHERE sexo like '%$busca%' ";
                                    break;
                                case '10':
                                    $query="SELECT * FROM cliente WHERE salario='$busca'";
                                    break;
                                case '11':
                                    $query="SELECT * FROM cliente WHERE profissao like '%$busca%' ";
                                    break;
                            }
                            
                            $qual = $_REQUEST['ordenar'];

                            switch($qual) {
                                case '0':
                                    $query.=" ORDER BY cpf;";
                                    break;
                                case '1':
                                    $query.=" ORDER BY nome;";
                                    break;
                                case '2':
                                    $query.=" ORDER BY sexo;";
                                    break;
                                case '3':
                                    $query.=" ORDER BY dataNascimento;";
                                    break;
                                case '4':
                                    $query.=" ORDER BY dataCadastro;";
                                    break;
                                case '5':
                                    $query.=" ORDER BY email;";
                                    break;
                                default:
                                    break;
                            }
                            $result = mysqli_query($conexao, $query) or die(mysql_error());
                            while($row = mysqli_fetch_array($result)) {
                                
                            echo '
                            <tr>
                              <td>'.$row['cpf'].'</td>
                              <td>'.$row['nome'].'</td>
                              <td>'.$row['sexo'].'</td>
                              <td>'.date("d/m/Y", strtotime($row['dataNascimento'])).'</td>
                              <td>'.date("d/m/Y", strtotime($row['dataCadastro'])).'</td>
                              <td>'.$row['email'].'</td>
                              <td>
                                  <div class="row">
                                        <div class="col">
                                            <a href="pagina_cliente_editar.php?cpf='.$row['cpf'].'" style="color: #A55C55;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                </svg>
                                            </a>
                                        </div>
                                        <div class="col" >
                                            <a href="back-end/excluir_cliente.php?cpf='.$row['cpf'].'" style="color: #A55C55;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                </svg>
                                            </a>
                                        </div>
                                  </div>
                              </td>
                            </tr>';
                            }

                            }
                            

                          ?>
                        </tbody>
                  </table>
              </div>
            </div>
      </div>

      </div>
      
    </div>
  </body>
</html>