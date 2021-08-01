<?php


    // pega dados
    if(isset($_REQUEST['submit'])){
        $inputCPF = $_REQUEST['inputC'];
        $inputSexo = $_REQUEST['inputSexo'];
        $inputEstadoCivil = $_REQUEST['inputEstadoCivil'];
        
        $inputDataNasc1 = str_replace("/", "-", $_POST["inputDataNasc"]);
        $inputDataNasc =  date('Y-m-d', strtotime($inputDataNasc1));

        $inputEmail = $_REQUEST['inputEmail'];

        $inputprofissao = $_REQUEST['inputProfissao'];
        $inputsalario = $_REQUEST['inputSalario'];


        $inputCEP = $_REQUEST['inputCEP'];
        $inputRua = $_REQUEST['inputRua'];
        $inputNum = $_REQUEST['inputNum'];
        $inputBairro = $_REQUEST['inputBairro'];
    }

    // prepara conexao
    $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
    
    if($conexao) {
        echo mysqli_connect_error();
    }

    $query = "UPDATE cliente SET sexo='$inputSexo', dataNascimento='$inputDataNasc', email='$inputEmail', 
    estadoCivil='$inputEstadoCivil', salario='$inputsalario',profissao='$inputprofissao',
     endBairro='$inputBairro', endRua='$inputRua',
    endNum='$inputNum'
    WHERE cpf = '$inputCPF'";
    mysqli_query($conexao, $query) or die(mysql_error());


    $conexao->close();
    //header('Location: ../pagina_cliente_editar.php');
    exit;
    return;
?>