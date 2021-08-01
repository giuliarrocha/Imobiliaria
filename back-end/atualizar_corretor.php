<?php

    // pega dados
    if(isset($_REQUEST['submit'])){
        $inputCPF = $_REQUEST['inputC'];
        $inputSexo = $_REQUEST['inputSexo'];
        
        $inputEmail = $_REQUEST['inputEmail'];

        $inputRua = $_REQUEST['inputRua'];
        $inputNum = $_REQUEST['inputNum'];
        $inputBairro = $_REQUEST['inputBairro'];

        $inputSalario = $_REQUEST['inputSalario'];
    }

    // prepara conexao
    $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
    
    if($conexao) {
        echo mysqli_connect_error();
    }

    $query = "UPDATE corretor SET sexo='$inputSexo', email='$inputEmail', 
     endBairro='$inputBairro', endRua='$inputRua',
    endNum='$inputNum', salario='$inputSalario'
    WHERE cpf = '$inputCPF'";
    mysqli_query($conexao, $query) or die(mysql_error());


    $conexao->close();
    header('Location: ../pagina_corretor_editar.php?cpf='.$inputCPF);
    exit;
    return;
?>