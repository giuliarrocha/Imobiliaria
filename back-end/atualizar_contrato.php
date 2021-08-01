<?php

    // pega dados
    if(isset($_REQUEST['submit'])){
        $inputCodigo = $_REQUEST['inputC'];

        $inputVencimento1 = str_replace("/", "-", $_POST["inputVencimento"]);
        $inputVencimento =  date('Y-m-d', strtotime($inputVencimento1));

        $inputInicio1 = str_replace("/", "-", $_POST["inputInicio"]);
        $inputInicio =  date('Y-m-d', strtotime($inputInicio1));
        
        $inputFinal1 = str_replace("/", "-", $_POST["inputFinal"]);
        $inputFinal =  date('Y-m-d', strtotime($inputFinal1));


        $inputValor = $_REQUEST['inputValor'];
        $inputPagamento = $_REQUEST['inputPagamento'];
        $inputAvaliacao = $_REQUEST['inputAvaliacao'];

    }

    // prepara conexao
    $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
    
    if($conexao) {
        echo mysqli_connect_error();
    }

    $query = "UPDATE contrato SET dataVencimento='$inputVencimento',  
      valorAluguel='$inputValor',
    formaPagamento='$inputPagamento', avaliacao='$inputAvaliacao'
    WHERE codigo = '$inputCodigo'";
    mysqli_query($conexao, $query) or die(mysql_error());


    $conexao->close();
    header('Location: ../pagina_contrato_editar.php?codigo='.$inputCodigo);
    exit;
    return;
?>