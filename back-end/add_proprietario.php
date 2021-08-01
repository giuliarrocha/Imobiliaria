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
        
        $inputDataNasc1 = str_replace("/", "-", $_POST["inputDataNasc"]);
        $inputDataNasc =  date('Y-m-d', strtotime($inputDataNasc1));

        $inputEmail = $_REQUEST['inputEmail'];

        $inputTelefone1 = $_REQUEST['inputTelefone1'];
        $inputTelefone2 = $_REQUEST['inputTelefone2'];

        
        $data_cad = date('Y-m-d');

        $inputCEP = $_REQUEST['inputCEP'];
        $inputCidade = $_REQUEST['inputCidade'];
        $inputRua = $_REQUEST['inputRua'];
        $inputNum = $_REQUEST['inputNum'];
        $inputBairro = $_REQUEST['inputBairro'];

        $inputConta = $_REQUEST['inputConta'];
        $inputAgencia = $_REQUEST['inputAgencia'];
        $inputBanco = $_REQUEST['inputBanco'];


        // cidade cep
        $query = "INSERT INTO CEP_CidadeProprietario (cep, cidade)
         VALUES ('$inputCEP', '$inputCidade')";
         echo $query;
        $result = mysqli_query($conexao, $query);

        // agencia_bancariaProprietario
        $query = "INSERT INTO agencia_bancariaProprietario (contaProprietario, agenciaProprietario, banco)
        VALUES ('$inputConta', '$inputAgencia', '$inputBanco')";
        echo $query;
        $result = mysqli_query($conexao, $query);
        
        if($result) {
            // cliente
            $query = "INSERT INTO `proprietario` (`cpf`, `nome`, `sexo`, `dataNascimento`, 
            `email`, `endBairro`, `endRua`, `endNum`, 
            `cep`, `agencia`, `conta`) VALUES
            ('$inputCPF', '$inputNome', '$inputSexo', '$inputDataNasc', 
            '$inputEmail', '$inputBairro', '$inputRua', '$inputNum',
             '$inputCEP', '$inputAgencia', '$inputConta');";
            echo $query;
            $result = mysqli_query($conexao, $query);
            
            if($result) {
                // telefones
                $query = "INSERT INTO telefoneProprietario (numero, cpfProprietario)
                VALUES ('$inputTelefone1', '$inputCPF')";
                mysqli_query($conexao, $query);
                $query = "INSERT INTO telefoneProprietario (numero, cpfProprietario)
                VALUES ('$inputTelefone2', '$inputCPF')";
                mysqli_query($conexao, $query);    
            }
        }
        
        $conexao->close();
    }

    header('Location: ../cadastro_proprietario.php');
    exit;
    return;
?>