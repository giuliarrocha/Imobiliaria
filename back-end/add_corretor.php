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
        
        $inputDataContratacao1 = str_replace("/", "-", $_POST["inputDataContratacao"]);
        $inputDataContratacao =  date('Y-m-d', strtotime($inputDataContratacao1));
        
        $inputDataNasc1 = str_replace("/", "-", $_POST["inputDataNasc"]);
        $inputDataNasc =  date('Y-m-d', strtotime($inputDataNasc1));

        $inputEmail = $_REQUEST['inputEmail'];

        $inputTelefone1 = $_REQUEST['inputTelefone1'];
        $inputTelefone2 = $_REQUEST['inputTelefone2'];

        $inputsalario = $_REQUEST['inputsalario'];

        $data_cad = date('Y-m-d');

        $inputCEP = $_REQUEST['inputCEP'];
        $inputCidade = $_REQUEST['inputCidade'];
        $inputRua = $_REQUEST['inputRua'];
        $inputNum = $_REQUEST['inputNum'];
        $inputBairro = $_REQUEST['inputBairro'];

        $inputConta = $_REQUEST['inputConta'];
        $inputAgencia = $_REQUEST['inputAgencia'];
        $inputBanco = $_REQUEST['inputBanco'];

        echo $inputDataNasc;


        // cidade cep
        $query = "INSERT INTO cep_cidadecorretor (cep, cidade)
         VALUES ('$inputCEP', '$inputCidade')";
        $result = mysqli_query($conexao, $query);

        // agencia_bancariacorretor
        $query = "INSERT INTO agencia_bancariacorretor (contaCorretor, agenciaCorretor, banco)
        VALUES ('$inputConta', '$inputAgencia', '$inputBanco')";
        echo $query;
        $result = mysqli_query($conexao, $query);
        
        if($result) {
            // cliente
            $query = "INSERT INTO corretor (`cpf`, `nome`, `sexo`, `dataNascimento`, `email`,  
            `dataContratacao`, `salario`, `endBairro`, `endRua`,
            `endNum`, `cep`, `agencia`, `conta`)
            VALUES ('$inputCPF', '$inputNome', '$inputSexo', '$inputDataNasc', '$inputEmail',
            '$inputDataContratacao', '$inputsalario', '$inputBairro', '$inputRua', 
            '$inputNum', '$inputCEP', '$inputAgencia', '$inputConta');";
            echo $query;
            $result = mysqli_query($conexao, $query);
            
            if($result) {
                // telefones
                if($inputTelefone1 != '0') {
                    $query = "INSERT INTO telefonecorretor (numero, cpfCorretor)
                    VALUES ('$inputTelefone1', '$inputCPF')";
                    mysqli_query($conexao, $query);
                }
                
                if($inputTelefone2 != '0') {
                    $query = "INSERT INTO telefonecorretor (numero, cpfCorretor)
                    VALUES ('$inputTelefone2', '$inputCPF')";
                    mysqli_query($conexao, $query);    
                }
                
            }
        }
        
    
        
        
        
        $conexao->close();
    }

    header('Location: ../cadastro_corretor.php');
    exit;
    return;
?>