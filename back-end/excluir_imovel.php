<?php

    if(isset($_REQUEST['codigo'])){
        // prepara conexao
        $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
        
        if($conexao) {
            echo mysqli_connect_error();
        }
        
        $codigo = $_REQUEST['codigo'];
                
        echo $codigo;

        // gerencia
        $query = "DELETE FROM gerencia WHERE codImovel='$codigo';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // contrato
        $query = "DELETE FROM contrato WHERE codigoImovel = '$codigo';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // imovel
        $query = "DELETE FROM imovel WHERE codigo = '$codigo';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

    }
    
    header('Location: ../index.php');
    exit;
    return;
?>