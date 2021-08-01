<?php

    // pega dados
    if(isset($_REQUEST['submit'])){
        $inputCodigo = $_REQUEST['inputC'];
        $inputTipo = $_REQUEST['inputTipo'];
        
        $inputAlugado = $_REQUEST['inputAlugado'];

        $inputRua = $_REQUEST['inputRua'];
        $inputNum = $_REQUEST['inputNum'];
        $inputBairro = $_REQUEST['inputBairro'];

        $inputTamanho = $_REQUEST['inputTamanho'];
    }

    // prepara conexao
    $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
    
    if($conexao) {
        echo mysqli_connect_error();
    }

    $query = "UPDATE imovel SET tipo='$inputTipo', alugado='$inputAlugado', 
     endBairro='$inputBairro', endRua='$inputRua',
    endNum='$inputNum', tamanho='$inputTamanho'
    WHERE codigo = '$inputCodigo'";
    mysqli_query($conexao, $query) or die(mysql_error());


    $conexao->close();
    header('Location: ../pagina_imovel_editar.php?codigo='.$inputCodigo);
    exit;
    return;
?>