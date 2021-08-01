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
            <a href="index.html" class="list-group-item list-group-item-action text-white active" style="background-color: #063647; border-color: #DBA67B;" aria-current="true">
              Imóveis
            </a>
            <a href="clientes.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Clientes</a>
            <a href="proprietarios.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Proprietários</a>
            <a href="corretores.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Corretores</a>
            <a href="contratos.html" class="list-group-item list-group-item-action text-white" style="background-color: #063647;">Contratos</a>
          </div>
        </div>
        <div class="col" style="background-color: #DFDFC9;">
          <h1 class="h2 text-center" style="font-family: 'Playfair Display SC', serif; color: #A55C55; margin-left: 20px; margin-top: 35px; margin-bottom: 35px;">
              Imóveis
          </h1>
  
          <div class="card w-75" style="margin-left: 140px; margin-bottom: 35px;">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Buscar:</label>
                            <input type="busca" class="form-control " id="exampleFormControlInput1" placeholder="Digite o que deseja procurar">
                        </div>
                    </div>
                    <div class="col">
                        <label for="exampleFormControlInput1" class="form-label">Em:</label>
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Todos os campos</option>
                            <option value="1">Código</option>
                            <option value="2">Tamanho</option>
                            <option value="3">Alugado</option>
                            <option value="4">Tipo</option>
                            <option value="5">CEP</option>
                            <option value="6">Cidade</option>
                            <option value="7">Bairro</option>
                            <option value="8">Rua e número</option>
                            <option value="9">Nome Proprietário</option>
                            <option value="10">CPF Proprietário</option>
                        </select>
                    </div>
                    <div class="col">
                      <a class="btn text-white" style="background-color: #A55C55; margin-top: 30px;" href="" role="button">Buscar</a>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px;">
                    <div class = "col">
                        <div class="row">
                            <div class = "col-4">
                                <label for="exampleFormControlInput1" class="form-label">Ordenar por:</label>
                            </div>
                            <div class = "col">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>Código</option>
                                    <option value="1">CPF Proprietário</option>
                                    <option value="2">Alugado</option>
                                    <option value="3">Tipo</option>
                                    <option value="4">Endereço</option>
                                    <option value="5">Tamanho</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class = "col">
                        <a class="btn text-white" style="background-color: #A55C55;" href="" role="button">Ordenar</a>
                    </div>
                </div>
                <div class="row">
                  <a class="btn text-white w-50" style="background-color: #A55C55; margin-top: 50px; margin-left: 150px;" href="" role="button">Cadastrar Novo Imóvel</a>
                </div>
            </div>
        </div>
          
          <div class="card text-center">
              <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="true" href="#">Dados</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link"  style="color: #A55C55;" href="#">Consultas</a>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                  <table class="table table-bordered">
                      <thead>
                          <tr>
                            <th scope="col">Código</th>
                            <th scope="col">CPF Proprietário</th>
                            <th scope="col">Alugado</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Endereço</th>
                            <th scope="col">Tamanho</th>
                            <th scope="col">Ações</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>031571</td>
                            <td>145.698.254-77</td>
                            <td>Sim</td>
                            <td>Kitnet</td>
                            <td>Rua Alberto Segalla, 1-33</td>
                            <td>70 m²</td>
                            <td>
                                <div class="row">
                                      <div class="col">
                                          <a href="" style="color: #A55C55;">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                              </svg>
                                          </a>
                                      </div>
                                      <div class="col" >
                                          <a href="" style="color: #A55C55;">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                              </svg>
                                          </a>
                                      </div>
                                      <div class="col">
                                          <a href="" style="color: #A55C55;">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                                  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                                  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                              </svg>
                                          </a>
                                      </div>
                                </div>
                            </td>
                          </tr>
                        </tbody>
                  </table>
              </div>
            </div>
      </div>
      </div>
      
    </div>
  </body>
</html>