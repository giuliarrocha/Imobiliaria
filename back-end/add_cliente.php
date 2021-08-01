<?php
    // prepara conexao
    $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
    
    if($conexao) {
        echo mysqli_connect_error();
    }
    
    // valida
    if(isset($_REQUEST['submit'])) {
        $inputNome = $_REQUEST['inputNome'];
        $inputCPF = $_REQUEST['inputCPF'];
        $inputSexo = $_REQUEST['inputSexo'];
        $inputEstadoCivil = $_REQUEST['inputEstadoCivil'];
        
        $inputDataNasc1 = str_replace("/", "-", $_POST["inputDataNasc"]);
        $inputDataNasc =  date('Y-m-d', strtotime($inputDataNasc1));

        $inputEmail = $_REQUEST['inputEmail'];

        $inputTelefone1 = $_REQUEST['inputTelefone1'];
        $inputTelefone2 = $_REQUEST['inputTelefone2'];

        $inputprofissao = $_REQUEST['inputprofissao'];
        $inputsalario = $_REQUEST['inputsalario'];

        $data_cad = date('Y-m-d');

        $inputCEP = $_REQUEST['inputCEP'];
        $inputCidade = $_REQUEST['inputCidade'];
        $inputRua = $_REQUEST['inputRua'];
        $inputNum = $_REQUEST['inputNum'];
        $inputBairro = $_REQUEST['inputBairro'];

        echo $inputDataNasc;


        // cidade cep
        $query = "INSERT INTO cep_cidadecliente (cep, cidade)
         VALUES ('$inputCEP', '$inputCidade')";
        $result = mysqli_query($conexao, $query);

        echo $query;
        // cliente
        $query = "INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email,  
        estadoCivil, salario, profissao, dataCadastro, 
        endBairro, endRua, endNum, cep)
         VALUES ('$inputCPF', '$inputNome', '$inputSexo', '$inputDataNasc', '$inputEmail',
         '$inputEstadoCivil', '$inputsalario', '$inputprofissao', '$data_cad', 
         '$inputBairro', '$inputRua', '$inputNum', '$inputCEP');";
         echo $query;
        $result = mysqli_query($conexao, $query);
        
        if($result) {
            // telefones
            $query = "INSERT INTO telefonecliente (numero, cpfCliente)
            VALUES ('$inputTelefone1', '$inputCPF')";
            mysqli_query($conexao, $query);
            $query = "INSERT INTO telefonecliente (numero, cpfCliente)
            VALUES ('$inputTelefone2', '$inputCPF')";
            mysqli_query($conexao, $query);    
        }
        
        
        $conexao->close();
    }

    header('Location: ../cadastro_cliente.php');
    exit;
    return;
?>